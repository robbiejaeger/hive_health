class Site < ApplicationRecord
  belongs_to :user
  has_many :hives

  validates :street, uniqueness: { scope: [:city, :state, :zip] }, on: :create
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  after_create :convert_address_to_long_lat

  def convert_address_to_long_lat
    formatted_address = "#{street}, #{city}, #{state} #{zip}"
    long_lat = Geocoder.coordinates(formatted_address)
    update(longitude: long_lat[1], latitude: long_lat[0])
  end

  def is_owner?(user)
    user.sites.ids.include?(id)
  end
end
