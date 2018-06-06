class AddDetailsToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :rating, :int, :default => -1
    add_column :restaurants, :photo, :string
  end
end
