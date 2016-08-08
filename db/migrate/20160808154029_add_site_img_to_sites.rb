class AddSiteImgToSites < ActiveRecord::Migration[5.0]
  def change
    add_attachment :sites, :site_img
  end
end
