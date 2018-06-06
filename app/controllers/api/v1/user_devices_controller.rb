class Api::V1::UserDevicesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { devices: current_user.devices, status: 200 }, status: :ok
  end

  def create 
    # TODO: need to associate with client_id
    current_user.devices.create(create_params)
    render json: { devices: current_user.devices, status: 200 }, status: :ok
  end

  def destroy
    device = UserDevice.find params[:id]
    if current_user.devices.include? device
      device.destroy
      render json: { success: device.destroyed?, status: 200 }, status: :ok
    else
      render json: { error: "You can't do the thing.", status: 403 }, status: :forbidden
    end
  end

  private
    def create_params
      params.require(:device).permit(:device_token, :platform)
    end

end
