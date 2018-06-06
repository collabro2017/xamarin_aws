namespace :ratings do
  desc "TODO"
  task set_order: :environment do
    # set all ratings to negative at first
    Rating.all.update_all(order: -1)

    positive = ["Fresh", "Savory", "Worth It", "Well-Cooked", "Helpful", "Fine", "Fast", "Loved It", "Aromatic", "Neat", "It's Okay", "Quiet", "5M", "10M", "Chill"]
    positive_ratings = Rating.where("name in (?)", positive)

    positive_ratings.update_all(order: 1)

    # set position of ratings (even is positive, odd is negative)
    # Food
    Rating.where(name: "Fresh").first.update_attributes(position: 0)
    Rating.where(name: "Salty").first.update_attributes(position: 1)
    Rating.where(name: "Savory").first.update_attributes(position: 2)
    Rating.where(name: "Bland").first.update_attributes(position: 3)
    Rating.where(name: "Worth It").first.update_attributes(position: 4)
    Rating.where(name: "Stale").first.update_attributes(position: 5)
    Rating.where(name: "Well-Cooked").first.update_attributes(position: 6)
    Rating.where(name: "Greasy").first.update_attributes(position: 7)

    # Customer Service
    Rating.where(name: "Helpful").first.update_attributes(position: 0)
    Rating.where(name: "Oh no!").first.update_attributes(position: 1)
    Rating.where(name: "Fine").first.update_attributes(position: 2)
    Rating.where(name: "Rude").first.update_attributes(position: 3)
    Rating.where(name: "Fast").first.update_attributes(position: 4)
    Rating.where(name: "Unpleasant").first.update_attributes(position: 5)
    Rating.where(name: "Loved It").first.update_attributes(position: 6)

    # Cleanliness
    Rating.where(name: "Aromatic").first.update_attributes(position: 0)
    Rating.where(name: "Stenchy").first.update_attributes(position: 1)
    Rating.where(name: "Neat").first.update_attributes(position: 2)
    Rating.where(name: "Sloppy").first.update_attributes(position: 3)
    Rating.where(name: "It's Okay").first.update_attributes(position: 4)
    Rating.where(name: "Messy").first.update_attributes(position: 5)

    # Vibe
    Rating.where(name: "Quiet").first.update_attributes(position: 0)
    Rating.where(name: "Crowded").first.update_attributes(position: 1)
    Rating.where(name: "Chill").first.update_attributes(position: 2)
    Rating.where(name: "Noisy").first.update_attributes(position: 3)

  end

end
