class CreateUserRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ratings do |t|
      t.references :user, foreign_key: true, :null => false
      t.references :restaurant, foreign_key: true, :null => false
      t.references :rating, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
