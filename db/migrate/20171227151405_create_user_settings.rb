class CreateUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_settings do |t|
      t.references :user, foreign_key: true
      t.boolean :location_notification, default: true
      t.boolean :trend_notification, default: false

      t.timestamps
    end
  end
end
