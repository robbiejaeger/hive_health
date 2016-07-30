class HivesController < ApplicationController

  def show
    @hive = Hive.find(params[:id])
  end
end
