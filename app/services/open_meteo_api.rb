# Service class for consuming the OpenMeteo weather
# API. API docs are available at https://open-meteo.com/en/docs
class OpenMeteoApi
  include HTTParty

  base_uri 'https://api.open-meteo.com/v1/'

  def weather_by_lat_lng(latitude, longitude)
    response = self.class.get("/forecast", query: default_params.merge(latitude: latitude, longitude: longitude))
    @current_temperature = response['current']
    @forecast_min_max = response['daily']['time'].zip(
      response['daily']['temperature_2m_min'],
      response['daily']['temperature_2m_max'])
    [@current_temperature, @forecast_min_max]
  end

  private

  def default_params
    {
      daily: 'weathercode,temperature_2m_max,temperature_2m_min',
      temperature_unit: 'fahrenheit',
      windspeed_unit: 'mph',
      precipitation_unit: 'inch',
      timezone: 'America/Denver',
      current: 'temperature_2m'
    }
  end
end
