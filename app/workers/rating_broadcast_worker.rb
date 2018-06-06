class RatingBroadcastWorker
  include Sidekiq::Worker

  def perform(stream, rating_id)
    logger.info "Broadcasting rating #{rating_id} to #{stream}"
    user_rating = UserRating.find rating_id
    ActionCable.server.broadcast stream, user_rating.as_json(:latest => true)
  end
end
