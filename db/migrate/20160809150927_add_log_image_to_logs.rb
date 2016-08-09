class AddLogImageToLogs < ActiveRecord::Migration[5.0]
  def change
    add_attachment :logs, :log_img
  end
end
