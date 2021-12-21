FactoryBot.define do
  factory :creator do
    creator_name { Faker::Name.first_name }
    creator_short_text { Faker::Lorem.sentence(word_count: 6) }
    creator_text { Faker::Lorem.sentence }
  end
end
