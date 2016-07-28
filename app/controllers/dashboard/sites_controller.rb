class Dashboard::SitesController < ApplicationController

  def show
  end

  def new
    @site = current_user.sites.new
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      flash[:success] = "You created a new site!"
      redirect_to dashboard_path
    else
      flash.now[:warning] = @site.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def site_params
    params.require(:site).permit(:name,
                                 :description,
                                 :street,
                                 :city,
                                 :state,
                                 :zip,
                                 :longitude,
                                 :latitude)
  end
end
