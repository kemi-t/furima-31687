FactoryBot.define do
  factory :item do
    name                { Faker::Name.initials(number: 2) }
    description         { Faker::Lorem.sentence }
    category_id         { 2 }
    condition_id        { 2 }
    price               { Faker::Number.number(digits: 4) }
    shipping_id         { 2 }
    prefecture_id       { 2 }
    days_to_ship_id     { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end