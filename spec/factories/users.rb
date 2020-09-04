FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(character_count = 5) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    first_name            { 'テスト' }
    last_name             { '太朗' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'タロウ' }
    birthday              { Faker::Date.backward }
  end
end