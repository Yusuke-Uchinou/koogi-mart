FactoryBot.define do
  factory :creator do
    creator_name { Faker::Name.first_name }
    creator_text { Faker::Lorem.sentence }
  end
end
