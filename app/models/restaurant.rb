class Restaurant < ApplicationRecord

  # associations
  has_many :user_ratings, :foreign_key => :restaurant_id
  has_many :ratings, :through => :user_ratings, :foreign_key => :rating_id

  # validations
  validates :name, presence: true, length: { minimum: 2 }

  includes :ratings

  # before actions
  after_save :schedule_update
  
  def latest_ratings
    self.user_ratings.latest.as_json(latest: true)
  end

  def top_ratings
    top = UserRating
      .joins(:rating)
      .where('user_ratings.restaurant_id = ?', self.id)
      .select('user_ratings.rating_id as rating_id, count(user_ratings.rating_id) as count')
      .group('user_ratings.rating_id')
      .order('count desc')
      .as_json(latest: false)

    # reject rating unless it's the first of its rating_category
    
  end

  def visitors_count
    self.user_ratings.count("DISTINCT user_id")
  end

  def schedule_update
    logger.info "Scheduling update of #{self.name} in 4 weeks"
    PlacesUpdateWorker.perform_in(4.weeks, self.id)
  end

  def as_json(options={})
    super(:except => [ :created_at, :updated_at, :id, :photo ],
           :methods => [:latest_ratings, :visitors_count]
          )
  end
end
