class SitesController < ApplicationController

  def index
  end

  def show
    @site = Site.find(params[:id])
  end
end
