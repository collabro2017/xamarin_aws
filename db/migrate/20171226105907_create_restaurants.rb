class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :place_id, :null => false
      t.point :coordinates, :default => '(0,0)'
      t.string :address, :null => false

      t.timestamps
    end
  end
end
