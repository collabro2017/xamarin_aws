class PlacesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def follow(place_id)
    stop_all_streams
    place_stream = "place/#{place_id['message']}"
    stream_from place_stream
  end

  def unfollow
    stop_all_streams
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
