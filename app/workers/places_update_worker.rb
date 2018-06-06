class PlacesUpdateWorker
  include Sidekiq::Worker

  def perform(restaurant_id)
    # Do something
    place = Restaurant.find restaurant_id
    logger.info "Updating Google place #{place.name}"

    begin
      spot = GooglePlacesHelper.get_place_details place.place_id
    rescue GooglePlaces::InvalidRequestError
      logger.error "Could not find place_id #{place.place_id}"
      raise ActiveRecord::RecordNotFound.new("Restaurant with place_id #{place.place_id} not found")
    end

    photo_url ||= spot.photos[0].fetch_url(800) if spot.photos.any?
    place.update_attributes!(
      name: spot.name,
      lat: spot.lat,
      lng: spot.lng,
      address: spot.vicinity,
      place_id: spot.place_id,
      photo: photo_url,
      rating: spot.rating
    )
  end
end
