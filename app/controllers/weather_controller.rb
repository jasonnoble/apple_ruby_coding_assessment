class WeatherController < ApplicationController
  def show
    # Assume the weather info is cached
    @cached_weather_data = true

    @weather = Rails.cache.fetch("weather/#{params[:zipcode]}", expires_in: 30.minutes) do
      # If we're in the block, then the cache either doesn't exist
      # or it expired, so it's no longer cached
      @cached_weather_data = false
      OpenMeteoApi.new.weather_by_lat_lng(params[:lat], params[:lng])
    end

    respond_to do |format|
      format.turbo_stream { }
      format.html {}
    end
  end
end
