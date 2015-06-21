class AddLatitudeAndLongitudeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :latitude, :float
    add_column :products, :longitude, :float
  end
end
