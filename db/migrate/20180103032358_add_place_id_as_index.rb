class AddPlaceIdAsIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :restaurants, :place_id
  end
end
