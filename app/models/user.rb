class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  # associations
  has_many :user_ratings, :foreign_key => :user_id
  has_many :ratings, :through => :user_ratings, :foreign_key => :rating_id
  has_many :user_devices, :dependent => :destroy  
  has_many :user_points, :dependent => :destroy
  has_one :user_setting, :dependent => :destroy

  accepts_nested_attributes_for :user_devices
  accepts_nested_attributes_for :user_setting

  alias_attribute :devices, :user_devices
  alias_attribute :points, :user_points

  after_save :create_settings

  mount_uploader :photo, UserImageUploader


  def rate(options={})
    category_id = Rating.find(options[:rating]).rating_category_id
    q = 
      self.user_ratings.joins(:rating)
      .where('ratings.rating_category_id = ? AND user_ratings.restaurant_id = ?', category_id, options[:restaurant])
      .select('user_ratings.*')
      .order('user_ratings.created_at DESC')
      .limit(1)
    last_rating_of_category = q.first unless q.empty?

    rating = self.user_ratings.create!(
        restaurant_id: options[:restaurant], 
        rating_id: options[:rating]
      )

    if last_rating_of_category == nil 
      self.create_points(value: 1, rating_category_id: category_id)
    else
      time_of_last_rating = last_rating_of_category.created_at
      if time_of_last_rating < DateTime.now - 4.hour
        self.create_points(value: 1, rating_category_id: category_id)
      end
    end

    rating
  end 

  def create_points(*options)
    value = options[0][:value]
    if scuttle_points + value < 0
      logger.warn "[create_points] Attempting to subtract more points than what is available"
      logger.warn "[create_points] total_points: #{scuttle_points}\tvalue: #{value}"
      return
    end

    self.points.create!(options)
  end

  def scuttle_points
    self.user_points.sum(&:value)
  end

  def create_settings
    if self.user_setting == nil
      self.create_user_setting
    end
  end

  def name
    first_name + " " + last_name
  end

  def render_with_settings
    as_json(
           :include => {
              :user_setting => {
                :only => [ :id, :location_notification, :trend_notification, :ratings_order ]
              }
            }
          )
  end


  def as_json(options={})
    super( options.merge(
           :except => [ :created_at, :updated_at, :provider, :uid ],
           :methods => [:scuttle_points]
          )
        )
  end

end
