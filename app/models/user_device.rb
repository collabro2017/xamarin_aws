class UserDevice < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :platform, presence: true, inclusion: { in: ["android", "ios"] }

  def as_json(options={})
    super(options.merge(
        {
          except: [:user_id, :created_at, :updated_at]   
        }
      )
    )
  end
end
