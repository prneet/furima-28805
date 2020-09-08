class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  with_options presence: true do
    validates :postal_code
    validates :genre_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number
  end
end