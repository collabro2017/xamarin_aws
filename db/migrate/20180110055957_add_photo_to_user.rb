class AddPhotoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo, :string, default: ""
  end
end
