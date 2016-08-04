require 'rails_helper'

describe WeatherService do
  context "#forecast_by_location" do
    it "returns a weather forecast for that location" do
      VCR.use_cassette("forecast") do
        forecast_info = WeatherService.new.forecast_by_location("39.7392","-104.9903")

        daily_forecasts = forecast_info["daily"]["data"]
        day1 = daily_forecasts.first

        expect(daily_forecasts.count).to eq(8)
        expect(forecast_info["latitude"]).to eq(39.7392)
        expect(forecast_info["longitude"]).to eq(-104.9903)
        expect(forecast_info["timezone"]).to eq("America/Denver")
      end
    end
  end
end
