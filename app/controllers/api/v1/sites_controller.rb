class Api::V1::SitesController < ApiBaseController

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end
end
