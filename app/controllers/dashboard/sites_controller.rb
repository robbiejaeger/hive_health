class Dashboard::SitesController < ApplicationController

  def new
    @site = current_user.sites.new
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      flash[:success] = "You created a new site!"
      redirect_to site_path(@site)
    else
      flash.now[:warning] = @site.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      flash[:success] = "Site information was changed."
      redirect_to site_path(@site)
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
                                   :latitude,
                                   :status,
                                   :site_img)
    end
end
