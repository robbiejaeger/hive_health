class Dashboard::SitesController < ApplicationController

  def new
    @site = current_user.sites.new
  end

  def create
    @site = current_user.sites.new(site_params)
    # SiteCreator.new(@site), then make a new save method in this PORO that will send something falsy if it fails
    if @site.save
      flash[:success] = "You created a new site!"
      redirect_to dashboard_path
    else
      flash.now[:warning] = @site.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(status: site_params[:status])
      flash[:success] = "Site status changed."
      redirect_to site_path(@site)
    else
      flash[:warning] = @site.errors.full_messages.join(", ")
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
                                 :status)
  end
end
