class Api::V1::RatingsController < ApplicationController
  # before_action :authorize_user!, only: [ :create ]
  
  def create    
    rating = Rating.create! create_params

    render json: { rating: rating.as_json, status: 200 }, status: :ok
  end


  def index
    if index_params.include?(:last_updated_only)
      render json: { last_updated: Rating.maximum(:updated_at), status: 200 }, status: :ok
      return
    end

    if index_params.include?(:category)
      ratings = Rating.by_category(index_params[:category])
    else
      ratings = Rating.all
    end

    render json: { last_updated: Rating.maximum(:updated_at), ratings: ratings.as_json, status: 200 }, status: :ok
  end


  def update
    rating = Rating.where(id: update_params[:id])

    rating.update_attributes! update_params

    render json: { rating: rating.as_json, status: 200 }, status: :ok
  end


  def export
    respond_to do |format|
      format.csv { send_data UserRating.to_csv, filename: "user_rating_#{Date.today}.csv"}
    end
  end


  private
    def index_params
      params.permit(:category, :last_updated_only)
    end

    def create_params
      params.require(:rating).permit(:name, :image, :rating_category_id, :remote_image_url, :position, :order)
    end

    def create_params
      params.require(:rating).permit(:id, :name, :image, :rating_category_id, :remote_image_url, :position, :order)
    end

    def authorize_user!
      authenticate_user!
    end
end
