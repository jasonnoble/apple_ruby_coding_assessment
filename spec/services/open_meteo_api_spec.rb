# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OpenMeteoApi' do
  describe '#weather_by_lat_lng(latitude, longitude)' do
    it 'returns an array of weather data' do
      VCR.use_cassette('weather_by_lat_lng') do
        weather_data = OpenMeteoApi.new.weather_by_lat_lng('39.7777343', '-104.8649863')
        expect(weather_data).to be_an(Array)
      end
    end
  end
end
