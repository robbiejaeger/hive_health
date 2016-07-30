class Dashboard::HivesController < ApplicationController

  def new
    @site = Site.find(params[:site_id])
    @hive = Hive.new
  end

  def create
    @hive = Site.find(params[:site_id]).hives.new(hive_params)
    if @hive.save
      flash[:success] = "Created a new hive!"
      redirect_to site_hive_path(@hive.site, @hive)
    else
      flash.now[:warning] = @hive.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def hive_params
    params.require(:hive).permit(:name, :description)
  end
end
