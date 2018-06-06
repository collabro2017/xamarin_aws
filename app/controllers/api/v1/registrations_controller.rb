class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def render_create_success
    render json: { user: @resource.render_with_settings, status: 200 }, status: :ok
  end
end
