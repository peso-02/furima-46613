FactoryBot.define do
  factory :item do
    name              { Faker::Commerce.product_name }
    description       { Faker::Lorem.sentence }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
