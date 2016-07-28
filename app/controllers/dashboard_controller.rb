class DashboardController < ApplicationController

  def show
    @sites = current_user.sites
  end
end
