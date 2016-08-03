class DashboardController < ApplicationController

  def show
    @sites = current_user.sites
    @weather_days = Weather.forecast_by_location(@sites[0].latitude, @sites[0].longitude)
    @sites_following_logs = current_user.logs_of_followed_sites
  end
end
