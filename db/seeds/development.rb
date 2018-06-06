if RatingCategory.count < 4
  puts "Seeding categories"
  RatingCategory.create(name: "Food")
  RatingCategory.create(name: "Customer Service")
  RatingCategory.create(name: "Cleanliness")
  RatingCategory.create(name: "Vibe")
end

if User.count == 0
  puts "Seeding users"
  User.create(first_name: "Gordon", last_name: "Ramsay", email: "gordonramsay@gmail.com", password: "password", password_confirmation: "password")
  User.create(first_name: "Simon", last_name: "Cowell", email: "simoncowell@gmail.com", password: "password", password_confirmation: "password")
  User.create(first_name: "Anton", last_name: "Ego", email: "antonego@gmail.com", password: "password", password_confirmation: "password")
end

if Rating.count == 0
  puts "Seeding ratings"
  Rating.create(rating_category_id: 1, name: "Fresh", image: "♨", order: 1, position: 0)
  Rating.create(rating_category_id: 1, name: "Salty", image: "😣", order: -1, position: 1)
  Rating.create(rating_category_id: 1, name: "Savory", image: "😋", order: 1, position: 2)
  Rating.create(rating_category_id: 1, name: "Bland", image: "😑", order: -1, position: 3)
  Rating.create(rating_category_id: 1, name: "Worth It", image: "💯", order: 1, position: 4)
  Rating.create(rating_category_id: 1, name: "Stale", image: "😞", order: -1, position: 5)
  Rating.create(rating_category_id: 1, name: "Well-Cooked", image: "🌡", order: 1, position: 6)
  Rating.create(rating_category_id: 1, name: "Greasy", image: "😫", order: -1, position: 7)

  Rating.create(rating_category_id: 2, name: "Helpful", image: "🤗", order: 1, position: 0)
  Rating.create(rating_category_id: 2, name: "Oh no!", image: "😤", order: -1, position: 1)
  Rating.create(rating_category_id: 2, name: "Fine", image: "💚", order: 1, position: 2)
  Rating.create(rating_category_id: 2, name: "Rude", image: "😒", order: -1, position: 3)
  Rating.create(rating_category_id: 2, name: "Fast", image: "💨", order: 1, position: 4)
  Rating.create(rating_category_id: 2, name: "Unpleasant", image: "⤵️", order: -1, position: 5)
  Rating.create(rating_category_id: 2, name: "Loved It", image: "😍", order: 1, position: 6)

  Rating.create(rating_category_id: 3, name: "Aromatic", image: "☺", order: 1, position: 0)
  Rating.create(rating_category_id: 3, name: "Stenchy", image: "😷", order: -1, position: 1)
  Rating.create(rating_category_id: 3, name: "Neat", image: "😌", order: 1, position: 2)
  Rating.create(rating_category_id: 3, name: "Sloppy", image: "☹", order: -1, position: 3)
  Rating.create(rating_category_id: 3, name: "It's Okay", image: "🆗", order: 1, position: 4)
  Rating.create(rating_category_id: 3, name: "Messy", image: "😖", order: -1, position: 5)

  Rating.create(rating_category_id: 4, name: "Quiet", image: "💬", order: 1, position: 0)
  Rating.create(rating_category_id: 4, name: "Crowded", image: "🌊", order: -1, position: 1)
  Rating.create(rating_category_id: 4, name: "Chill", image: "😎", order: 1, position: 2)
  Rating.create(rating_category_id: 4, name: "Noisy", image: "🗣", order: -1, position: 3)

  # Rating.create(rating_category_id: 1, name: "Savory", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/face-savouring-delicious-food_1f60b.png")
  # Rating.create(rating_category_id: 1, name: "Greasy", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/weary-face_1f629.png")
  # Rating.create(rating_category_id: 1, name: "Fresh", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/hot-springs_2668.png")
  # Rating.create(rating_category_id: 1, name: "Stale", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/disappointed-face_1f61e.png")
  # Rating.create(rating_category_id: 1, name: "Well-Cooked", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/thermometer_1f321.png")
  # Rating.create(rating_category_id: 1, name: "Salty", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/persevering-face_1f623.png")
  # Rating.create(rating_category_id: 1, name: "Bland", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/expressionless-face_1f611.png")
  
  # Rating.create(rating_category_id: 2, name: "Exciting", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/smiling-face-with-open-mouth-and-smiling-eyes_1f604.png")
  # Rating.create(rating_category_id: 2, name: "Fine", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/green-heart_1f49a.png")
  # Rating.create(rating_category_id: 2, name: "Fast", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/dash-symbol_1f4a8.png")
  # Rating.create(rating_category_id: 2, name: "Oh no!", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/face-with-look-of-triumph_1f624.png")
  # Rating.create(rating_category_id: 2, name: "Rude", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/unamused-face_1f612.png")
  # Rating.create(rating_category_id: 2, name: "Helpful", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/smiling-face-with-heart-shaped-eyes_1f60d.png")
  # Rating.create(rating_category_id: 2, name: "Loved It", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/hugging-face_1f917.png")

  # Rating.create(rating_category_id: 3, name: "Messy", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/confounded-face_1f616.png")
  # Rating.create(rating_category_id: 3, name: "Stenchy", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/face-with-medical-mask_1f637.png")
  # Rating.create(rating_category_id: 3, name: "It's Okay", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/squared-ok_1f197.png")
  # Rating.create(rating_category_id: 3, name: "Sloppy", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/white-frowning-face_2639.png")
  # Rating.create(rating_category_id: 3, name: "Aromatic", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/white-smiling-face_263a.png")
  # Rating.create(rating_category_id: 3, name: "Neat", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/relieved-face_1f60c.png")

  # Rating.create(rating_category_id: 4, name: "Quiet", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/speech-balloon_1f4ac.png")
  # Rating.create(rating_category_id: 4, name: "Chill", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/smiling-face-with-sunglasses_1f60e.png")
  # Rating.create(rating_category_id: 4, name: "Noisy", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/speaking-head-in-silhouette_1f5e3.png")
  # Rating.create(rating_category_id: 4, name: "Crowded", remote_image_url: "https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/water-wave_1f30a.png")
end

if Restaurant.count == 0
  puts "Seeding restaurants"
  Restaurant.create(name: "Fancy Restaurant", lat: 0, lng: 0, place_id: "abc1", address: "Somewhere over the rainbow")
  Restaurant.create(name: "Low-class Restaurant", lat: 0, lng: 0, place_id: "abc2", address: "Somewhere over the rainbow")
  Restaurant.create(name: "Subway", lat: 0, lng: 0, place_id: "abc3", address: "Somewhere over the rainbow")
  Restaurant.create(name: "Chipotle", lat: 0, lng: 0, place_id: "abc4", address: "Somewhere over the rainbow")
end 

if UserRating.count == 0
  puts "Seeding user ratings"
  User.first.rate({
    restaurant: Restaurant.first.id,
    rating: Rating.first.id
    })
  User.first.rate({
    restaurant: Restaurant.first.id,
    rating: Rating.last.id
    })
  User.first.rate({
    restaurant: Restaurant.first.id,
    rating: Rating.last.id
    })

  User.first.rate({
    restaurant: Restaurant.last.id,
    rating: Rating.last.id
    })
end