class User < ApplicationRecord
  has_many :sites
  has_many :hives, through: :sites

  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :site

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.first_name = auth_info.info.first_name
      new_user.last_name = auth_info.info.last_name
      new_user.email = auth_info.info.email
      new_user.token = auth_info.credentials.token
      new_user.expires_at = auth_info.credentials.expires_at
    end
  end

  def follow(site)
    following_relationships.create(site: site)
  end

  def unfollow(site)
    following_relationships.find_by(site: site).destroy
  end
end
