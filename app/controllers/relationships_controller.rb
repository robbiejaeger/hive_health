class RelationshipsController < ApplicationController

  def follow_site
    @site = Site.find(params[:id])
    if current_user.follow(@site)
      respond_to do |format|
        format.html { redirect_to site_path(@site) }
        format.js
      end
    end
  end

  def unfollow_site
    @site = Site.find(params[:id])
    if current_user.unfollow(@site)
      respond_to do |format|
        format.html { redirect_to site_path(@site) }
        format.js
      end
    end
  end
end
