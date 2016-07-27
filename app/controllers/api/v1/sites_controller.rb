class Api::V1::SitesController < ApplicationController

  def index
    @sites = Site.all
  end
end
