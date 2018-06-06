class AddPositionToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :position, :int, default: 0
  end
end
