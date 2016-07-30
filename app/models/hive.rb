class Hive < ApplicationRecord
  belongs_to :site
  has_many :logs

  validates :name, presence: true
end
