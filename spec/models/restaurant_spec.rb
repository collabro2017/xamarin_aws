require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:new_restaurant) { Restaurant.new }

  context "when restaurant has no ratings" do
    it "should return empty arrays for top_ratings and latest_ratings" do
      expect(new_restaurant.top_ratings).to eq([])
      expect(new_restaurant.latest_ratings).to eq([])
    end
  end

end
