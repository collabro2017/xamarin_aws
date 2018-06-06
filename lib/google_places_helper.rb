class GooglePlacesHelper
  # https://github.com/qpowell/google_places

  @@zoom_hash = {
    1 => 2000000,
    2 => 1000000,
    3 => 500000,
    4 => 200000,
    5 => 100000,
    6 => 50000,
    7 => 20000,
    8 => 10000,
    9 => 5000,
    10 => 3000,
    11 => 2000,
    12 => 1000,
    13 => 500,
    14 => 200,
    15 => 100,
    16 => 50,
    17 => 20,
    18 => 10,
    19 => 5
  }

  def self.get_place_details place_id
    @client = GooglePlaces::Client.new(Rails.application.secrets.google_places_api_key)
    result = @client.spot(place_id)
    return result
  end

  def self.get_nearby(lat, lng, z=13, query='')
    @client = GooglePlaces::Client.new(Rails.application.secrets.google_places_api_key)
    spots = []
    if !query.blank?
      results = @client.predictions_by_input(
          query,
          lat: lat,
          lng: lng,
          radius: get_radius_for_zoom(z),
          types: 'establishment', # cannot use 'restaurant' since not supported by this particular API
          language: I18n.locale,
      )  

      place_ids = []
      results.each do |r|
        place_ids << r.place_id
      end

      place_ids.each do |id|
        s = @client.spot(id)
        spots << s if s.types.include? 'food'
      end

    else
      spots = @client.spots(lat, lng, :radius => get_radius_for_zoom(z), :types => location_types)
    end

    spots
  end

  def self.location_types
    ['restaurant']
  end

  def self.radius # 5 miles in meters
    8046.72
  end

  def self.get_radius_for_zoom z
    if z >= 1 && z <= 19
      @@zoom_hash[z]
    else
      @@zoom_hash[13]
    end
  end
end
