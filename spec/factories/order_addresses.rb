FactoryBot.define do
  factory :order_address do
    token        { 'card.token' }
    postal_code  { '590-0000' }
    region_id    { 1 }
    city         { Faker::Address.city }
    address      { Faker::Address.street_address }
    build        { Faker::Address.building_number }
    phone_number { '09012341234' }
    user_id      { 1 }
    item_id      { 1 }
  end
end