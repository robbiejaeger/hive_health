class Site < ApplicationRecord
  belongs_to :user
  has_many :hives
  has_many :logs, through: :hives

  has_many :follower_relationships, foreign_key: :site_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :user

  validates :street, uniqueness: { scope: [:city, :state, :zip] }, on: :create
  validates :street, presence: true, on: :create
  validates :city, presence: true, on: :create
  validates :state, presence: true, on: :create
  validates :zip, presence: true, on: :create

  after_create :convert_address_to_long_lat

  def convert_address_to_long_lat
    formatted_address = "#{street}, #{city}, #{state} #{zip}"
    long_lat = Geocoder.coordinates(formatted_address)
    update(longitude: long_lat[1], latitude: long_lat[0])
  end
end
