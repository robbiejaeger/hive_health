FactoryGirl.define do
  factory :site do
    name { Faker::Address.street_name }
    description { Faker::Lorem.paragraph }
    street
    city "Des Plaines"
    state "IL"
    zip "60018"
    user_id 1
    status "healthy"
  end

  factory :hive do
    name { Faker::Address.street_name }
    description { Faker::Lorem.paragraph }
    site_id 1
  end

  sequence :street do |n|
    "#{1830 + n} Krowka Drive"
  end

  factory :user do
    uid
    first_name
    last_name
    email
  end

  sequence :uid do |n|
    "#{100 + n}"
  end

  sequence :first_name do |n|
    "FirstTest#{n}"
  end

  sequence :last_name do |n|
    "LastTest#{n}"
  end

  sequence :email do |n|
    "test#{n}@example.com"
  end
end
