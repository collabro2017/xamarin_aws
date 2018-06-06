class ChangeCoordinatesInRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :coordinates, :point
    add_column :restaurants, :lat, :float
    add_column :restaurants, :lng, :float
  end
end
