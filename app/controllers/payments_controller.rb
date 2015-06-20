class PaymentsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_product

  def new
    result = Braintree::Customer.create(
      :first_name => current_user.first_name,
      :last_name => current_user.last_name,
      :email => current_user.email,
    )

    if result.success?
      @client_token = Braintree::ClientToken.generate(
        customer_id: result.customer.id
      )
    else
      render :new, notice: "something when wrong"
    end
  end

  def create
    result = Braintree::Transaction.sale(
      merchant_account_id: @product.owner.merchant_id,
      amount: @product.price,
      payment_method_nonce: "nonce-from-the-client",
      service_fee_amount: "1.00"
    )
    if result.success?
      Order.create!(product: @product, user: current_user)

      if current_user.mobile_number
        client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]

        client.account.messages.create({
          :from => ENV["TWILIO_FROM_NUMBER"],
          :to => current_user.mobile_number,
          :body => "There is a new order of your product: #{@product.name}",
        })
      end

      redirect_to thanks_path
    else
      render :new, notice: "Something went wrong"
    end
  end

  private

  def set_product
    @product ||= Product.find(params[:product_id])
  end
end

