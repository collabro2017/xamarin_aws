class RatingCategory < ApplicationRecord

  def ratings
    Rating.where(rating_category_id: self.id)
  end  
end
