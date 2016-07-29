class Api::V1::Users::SitesController < ApplicationController

  def index
    @sites = User.find(params[:user_id]).sites
  end
end
