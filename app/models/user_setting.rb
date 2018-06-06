class UserSetting < ApplicationRecord
  belongs_to :user

  def as_json(options={})
    super( except: [ :id, :user_id, :created_at, :updated_at ] )
  end
end
