require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(first_name: "John", last_name: "Doe", email: "test@sample.com", password: "password", password_confirmation: "password") }

  context "when a user is created" do
    it "should create default settings" do
      expect(user.user_setting).not_to be_nil
    end
  end

  context "when user is deleted" do
    it "should delete devices and settings" do
      @user = user
      @user.devices.create(device_token: "1232132")
      
      expect{ @user.destroy }.to change { UserSetting.count }.by(-1)
      expect( UserDevice.count ).to eq(0)
    end
  end
end
