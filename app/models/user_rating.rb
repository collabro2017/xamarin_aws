class UserRating < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :restaurant
  belongs_to :rating

  # validations
  validates :user_id, :restaurant_id, :rating_id, presence: true

  accepts_nested_attributes_for :restaurant

  # scopes
  scope :latest, -> { where("created_at >= ? AND created_at <= ?", DateTime.now - 1.hour, DateTime.now) }
  
  def as_json(options={})
    if options[:latest] 
      {
        timestamp: updated_at,
        user_rating_id: id,
        rating: rating.as_json
      }
    else
      rating.as_json
    end
  end

  def self.to_csv
    
    column_headers = ["ID", "User ID", "User Name", "Restaurant ID", "Restaurant Name", "Rating Name", "Rating Emoji", "Timestamp"]
    CSV.generate do |csv|
      csv << column_headers
      all.each do |r|
        csv << [r.id, r.user_id, r.user.name, r.restaurant_id, r.restaurant.name, r.rating.name, r.rating.image, r.created_at]
      end
    end
  end

end
