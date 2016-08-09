class DashboardController < ApplicationController

  before_action :require_login

  def require_login
    unless current_user
      flash[:warning] = "#{view_context.link_to('Login', google_login_path)} before accessing your dashboard."
      redirect_to root_path
    end
  end

  def show
    @sites = current_user.sites
    @sites_following_logs = current_user.logs_of_followed_sites
  end
end
