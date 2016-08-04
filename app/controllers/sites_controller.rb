class SitesController < ApplicationController

  def index
  end

  def show
    @site = Site.find(params[:id])
    @hives = @site.hives
    @weather_days = Weather.forecast_by_location(@site.latitude, @site.longitude)
  end
end
