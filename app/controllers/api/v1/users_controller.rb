class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :password_reset ]

  def show
    user = User.find user_id
    if current_user == user
      render json: { user: user.render_with_settings, status: 200 }, status: :ok
    else
      render json: { user: user.as_json, status: 200 }, status: :ok
    end
  end


  def update
    if params[:id].present? && current_user.id != params[:id]
      render json: { error: "You cannot do the thing.", status: 403 }, status: :forbidden
      return
    end

    current_user.update_attributes!(update_params)

    render json: { user: current_user.render_with_settings, status: 200 }, status: :ok
  end

  def password_reset
    @token = reset_password_params[:token]
    @client = reset_password_params[:client_id]
    @uid = reset_password_params[:uid]

    render "layouts/password_reset"
  end

  private
    def update_params
      params.require(:user)
            .permit(:first_name, 
                    :last_name, 
                    :email, 
                    :photo,
                    user_setting_attributes: [ :id, :location_notification, :trend_notification, :ratings_order => [] ]
                    )
    end

    def reset_password_params
      params.permit(:token, :uid, :client_id)
    end

    def user_id
      params[:id] || current_user.id
    end

end
