require 'rails_helper'

RSpec.describe Api::V1::RatingsController, type: :controller do
  describe "GET #index" do
    # before(:each) do
    #   @user = FactoryGirl.create :user
    #   request.headers["Authorization"] = @user.access_token
    # end

    it "returns a list of all ratings" do
      
      
      # request      
      get :index

      # expectations
      expect(response.status).to eq 200

      body = JSON.parse response.body, symbolize_names: true
      response_desc = body[:newsfeeds].map { |e| e[:desc] }
      expect(response_desc).to include *newsfeed_desc
    end

    context "community not found" do
      it "will return 404" do
        get :index, community_id: @community1.id

        expect(response.status).to eq 404
      end
    end
  end
end
