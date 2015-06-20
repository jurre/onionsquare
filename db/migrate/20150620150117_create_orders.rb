class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.datetime :created_at
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
