class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActionController::ParameterMissing, with: :render_missing_parameters
  rescue_from ActiveModel::ForbiddenAttributesError, with: :render_forbidden_parameters
  rescue_from GooglePlaces::UnknownError, with: :render_google_unknown_error

  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_unprocessable_entity_response(exception)
    render json: { error: exception.record.errors, status: 422 }, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message, status: 404 }, status: :not_found
  end

  def render_missing_parameters(exception)
    render json: { error: "#{exception.param} is missing.", status: 400 }, status: :bad_request
  end

  def render_forbidden_parameters(exception)
    render json: { error: exception.message, status: 400 }, status: :bad_request
  end

  def render_google_unknown_error(exception)
    render json: { error: "Google Places returned an unknown error", status: 500 }, status: :internal_server_error
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
  end

end
