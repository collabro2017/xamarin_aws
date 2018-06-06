class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :rating_category, foreign_key: true
      t.string :image, :null => false
      t.string :name, :null => false
      t.integer :order, :default => 0

      t.timestamps
    end
  end
end
