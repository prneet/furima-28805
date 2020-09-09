FactoryBot.define do
  factory :item do
    name { 'アイテム' }
    text { Faker::Lorem.sentence }
    genre_id { 1 }
    status_id { 1 }
    region_id { 1 }
    postage_id{ 1 }
    post_day_id { 1 }
    price { 1000 }
    association :user
  end
end