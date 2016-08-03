class DashboardController < ApplicationController

  def show
    @sites = current_user.sites
    @sites_following_logs = current_user.logs_of_followed_sites
  end
end
