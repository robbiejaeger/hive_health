class Log < ApplicationRecord
  belongs_to :hive

  has_attached_file :log_img,
                    styles: {
                      thumb: '100x100>',
                      medium: '300x300>',
                      large: '500x500>'
                    }

  validates_attachment_content_type :log_img, content_type: /\Aimage\/.*\Z/
  validates :notes, presence: true
end
