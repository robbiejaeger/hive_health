class Dashboard::LogsController < ApplicationController

  def new
    @site = Site.find(params[:site_id])
    if @site.user != current_user
      flash[:warning] = "Not authorized."
      redirect_to root_path
    else
      @hive = Hive.find(params[:hive_id])
      @log = Log.new
    end
  end

  def create
    @site = Site.find(params[:site_id])
    @hive = Hive.find(params[:hive_id])
    @log = @hive.logs.new(log_params)
    if @log.save
      flash[:success] = "Created a new log!"
      redirect_to site_hive_path(@hive.site, @hive)
    else
      flash.now[:warning] = @log.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def log_params
    params.require(:log).permit(:notes, :log_img)
  end
end
