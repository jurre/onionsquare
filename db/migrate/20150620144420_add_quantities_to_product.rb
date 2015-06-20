class AddQuantitiesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal
    add_column :products, :items_available, :integer
    add_column :products, :available_until, :date
  end
end
