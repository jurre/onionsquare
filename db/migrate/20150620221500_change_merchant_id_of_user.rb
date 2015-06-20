class ChangeMerchantIdOfUser < ActiveRecord::Migration
  def change
    remove_column :users, :merchant_id, :integer
    add_column :users, :merchant_id, :string
  end
end
