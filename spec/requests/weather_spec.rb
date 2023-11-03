require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /show" do
    it "returns http success" do
      VCR.use_cassette('weather_for_80022') do
        get "/weather/80022?lat=39.8666&lng=-104.7754"
        expect(response).to have_http_status(:success)
      end
    end
  end

end
