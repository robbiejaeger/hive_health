class HivesController < ApplicationController

  def show
    @hive = Hive.find(params[:id])
    @site = @hive.site
    @logs = @hive.logs
  end
end
