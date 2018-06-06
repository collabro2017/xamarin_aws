class CreateUserDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :user_devices do |t|
      t.references :user, foreign_key: true
      t.string :device_token, null: false
      t.string :platform, null: false, default: "ios"

      t.timestamps
    end
  end
end
