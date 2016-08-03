class WeatherService

  def initialize
    @conn = Faraday.new("https://api.forecast.io")
  end

  def forecast_by_location(latitude, longitude)
    response = @conn.get("/forecast/#{ENV['DARK_SKY_FORECAST_API']}/#{latitude},#{longitude}")
    parse_response(response)
  end

  private
    def parse_response(response)
      JSON.parse(response.body)
    end
end
