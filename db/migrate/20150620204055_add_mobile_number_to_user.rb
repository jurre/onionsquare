class AddMobileNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile_number, :string
  end
end
