class Api::V1::RestaurantsController < ApplicationController

  before_action :authenticate_user!, only: [ :rate ]

  def index
    raise ActionController::ParameterMissing.new("lat, lng") if !(search_params[:lat].present? && search_params[:lng].present?)
        
    query = search_params[:q]
    lat = search_params[:lat]
    lng = search_params[:lng]
    z = search_params[:z].to_i || 13
    
    # TODO: Move this elsewhere
    GooglePlaces::Spot.include(GoogleSpot)

    response = spots = GooglePlacesHelper.get_nearby(lat, lng, z, query)[0..10]

    # merge result from Google Places with what we already have in the db
    place_ids = spots.pluck(:place_id)
    if place_ids.present?
      stored_restaurants = Restaurant.where(place_id: place_ids)
      stored_place_ids = stored_restaurants.pluck(:place_id)
      response = spots.reject { |x| stored_place_ids.include? x.place_id }
      response += stored_restaurants
    end

    render json: { restaurants: response.as_json, status: 200 }, status: :ok
  end


  def rate
    raise ActionController::ParameterMissing.new("rating_id") if !(rate_params[:rating_id].present?)

    restaurant = Restaurant.find_by place_id: rate_params[:id]

    if restaurant == nil
      # check google places
      begin
        spot = GooglePlacesHelper.get_place_details rate_params[:id]
      rescue GooglePlaces::InvalidRequestError
        logger.error "Could not find place_id #{rate_params[:id]}"
        raise ActiveRecord::RecordNotFound.new("Restaurant with place_id #{rate_params[:id]} not found")
      end

      photo_url ||= spot.photos[0].fetch_url(800) if spot.photos.any?
      restaurant = Restaurant.create!(
        name: spot.name,
        lat: spot.lat,
        lng: spot.lng,
        address: spot.vicinity,
        place_id: spot.place_id,
        photo: photo_url,
        rating: spot.rating
      )
    end

    rating = Rating.find_by! id: rate_params[:rating_id]

    user_rating = current_user.rate restaurant: restaurant.id, rating: rating.id

    render json: { user_rating: user_rating.as_json(:latest => true), status: 200 }, status: :ok

    stream = "place/#{restaurant.place_id}"
    RatingBroadcastWorker.perform_async(stream, user_rating.id)

  end


  def show
    restaurant = Restaurant.find_by place_id: params[:id]
    if restaurant.present?
      render json: { restaurant: restaurant, status: 200 }, status: :ok
    else
      begin
        spot = GooglePlacesHelper.get_place_details params[:id]
        render json: { restaurant: spot, status: 200 }, status: :ok
      rescue GooglePlaces::InvalidRequestError => e
        spot = nil
        logger.error "Could not find place_id #{rate_params[:id]}"
        raise ActiveRecord::RecordNotFound.new("Restaurant with place_id #{rate_params[:id]} not found")
      rescue GooglePlaces::UnknownError => e
        spot = nil
        logger.error "Google Places returned an unknown error"
        raise e
      end
    end
  end


  def generate_ratings
    restaurant = Restaurant.find_by place_id: params[:id]

    if restaurant == nil
      # check google places
      begin
        spot = GooglePlacesHelper.get_place_details rate_params[:id]
      rescue GooglePlaces::InvalidRequestError
        logger.error "Could not find place_id #{rate_params[:id]}"
        raise ActiveRecord::RecordNotFound.new("Restaurant with place_id #{rate_params[:id]} not found")
      end

      photo_url ||= spot.photos[0].fetch_url(800) if spot.photos.any?
      restaurant = Restaurant.create!(
        name: spot.name,
        lat: spot.lat,
        lng: spot.lng,
        address: spot.vicinity,
        place_id: spot.place_id,
        photo: photo_url,
        rating: spot.rating
      )
    end

    (0..10).each do |i|
      rand_id = Rating.pluck(:id).sample
      rating = Rating.find rand_id

      # user_rating = current_user.rate restaurant: restaurant.id, rating: rating.id
      user_rating = User.first.rate restaurant: restaurant.id, rating: rating.id

      # stream = "place/#{restaurant.place_id}"
      # ActionCable.server.broadcast stream, user_rating.as_json(:latest => true)
    end

    render json: { restaurant: restaurant.as_json, status: 200 }, status: :ok  
  end

  private
    def search_params
      params.permit(:q, :lat, :lng, :z)
    end

    def rate_params
      params.permit(:id, :rating_id)
    end
end
