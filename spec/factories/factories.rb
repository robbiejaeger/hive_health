FactoryGirl.define do
  factory :site do
    name { Faker::Address.street_name }
    description { Faker::Lorem.paragraph }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    user_id 1
  end
end
