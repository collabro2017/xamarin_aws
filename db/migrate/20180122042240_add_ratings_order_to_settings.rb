class AddRatingsOrderToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :user_settings, :ratings_order, :text, array: true, default: [1,2,3,4]
  end
end
