class Api::V1::Users::SitesController < ApiBaseController

  def index
    @sites = User.find(params[:user_id]).sites
  end
end
