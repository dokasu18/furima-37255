FactoryBot.define do
  factory :item do
    name                { '絵本' }
    comment             { Faker::Lorem.sentence }
    category_id         { 2 }
    condition_id        { 2 }
    cost_id             { 2 }
    area_id             { 2 }
    shipping_date_id    { 2 }
    price               { '1000' }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
