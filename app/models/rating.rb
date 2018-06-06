class Rating < ApplicationRecord

  # associations
  has_many :user_rating
  belongs_to :rating_category

  includes :rating_category

  # validations
  validates :rating_category_id, inclusion: { in: 1..RatingCategory.count }

  # scopes
  scope :by_category, -> (category_id) { where("rating_category_id = (?)", category_id) }

  # uploader
  # mount_uploader :image, RatingEmojiUploaderUploader

  def category
    self.rating_category.name
  end

  def images
    {
      small: self.image.small.url,
      medium: self.image.medium.url,
      large: self.image.large.url
    }
  end

  def as_json(options={})
    super( except: [ :created_at, :updated_at ],
            methods: [ :category ] )
  end

end
