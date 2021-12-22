FactoryBot.define do
  factory :order do
    order_name { Faker::Lorem.sentence(word_count: 3) }
    order_text { Faker::Lorem.sentence }
    order_price_min { 10000 }
    order_price_max { 20000 }
    genre_id { 1 }
    day_min { 1 }
    day_max { 2 }

    after(:build) do |order|
      order.main_order_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      order.order_images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
