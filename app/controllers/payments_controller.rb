class PaymentsController < ApplicationController
  before_action :authenticate_user!
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
    Order.create!(product: @product, user: current_user)

    redirect_to thanks_path
  end

  private

  def set_product
    @product ||= Product.find(params[:product_id])
  end
end

