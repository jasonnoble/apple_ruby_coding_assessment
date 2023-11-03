require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /show" do
    it "returns http success" do
      VCR.use_cassette('weather_for_80022') do
        get "/weather/80022?lat=39.8666&lng=-104.7754"
        expect(response).to have_http_status(:success)
      end
    end

    it "returns an error when lat/lng aren't provided" do ||
      VCR.use_cassette('weather_for_80061') do
        get "/weather/80061"
        expect(response).to have_http_status(:success)
        expect(response.body).to match(/Unable to retrieve weather for/)
      end
    end
  end

end
