class ProductBelongsToUser < ActiveRecord::Migration
  def change
    add_column :products, :user_id, :integer
  end
end
