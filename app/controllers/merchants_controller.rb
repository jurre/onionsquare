class MerchantsController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    result = create_merchant
    if result.success?
      current_user.update(merchant_id: result.merchant_account.id)
      redirect_to new_product_path
    else
      @errors = result.errors
      render :new, notice: "Something went wrong"
    end
  end

  private

  def create_merchant
    Braintree::MerchantAccount.create(
      :individual => {
        :first_name => current_user.first_name,
        :last_name => current_user.last_name,
        :email => current_user.email,
        :date_of_birth => "1981-11-19",
        :address => {
          :street_address => "111 Main St",
          :locality => "Chicago",
          :region => "IL",
          :postal_code => "60622"
        }
      },
      :business => {
        :legal_name => params[:business_name],
        :dba_name => params[:business_name],
        :tax_id => params[:tax_id],
      },
      :funding => {
        :destination => Braintree::MerchantAccount::FundingDestination::Email,
        :email => current_user.email,
      },
      :tos_accepted => true,
      :master_merchant_account_id => ENV["BRAINTREE_MAIN_MERCHANT_ID"]
    )
  end
end
