class CreateUserPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :user_points do |t|
      t.references :user, foreign_key: true, :null => false
      t.references :rating_category, foreign_key: true
      t.integer :value, :default => 0

      t.timestamps
    end
  end
end
