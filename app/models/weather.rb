class Weather < OpenStruct

  def self.service
    @service = WeatherService.new
  end

  def self.forecast_by_location(latitude, longitude)
    raw_response = service.forecast_by_location(latitude, longitude)

    raw_response["daily"]["data"].map do |raw_day|
      Weather.new(raw_day)
    end
  end

  def date_formatted
    Time.at(time).strftime("%A, %b %-d")
  end
end
