class Log < ApplicationRecord
  belongs_to :hive

  validates :notes, presence: true
end
