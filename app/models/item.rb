class Item < ApplicationRecord
  has_one_attached :image
  has_one :order
  belongth_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :post_day

  HALF_NUMBER_REGEX = /\A[0-9]+\z/.freeze,

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, format: {with: HALF_NUMBER_REGEX, message: 'Half-width number' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  with_options presence: true, numecality: { other_than: 0, message: "can't be blank" } do
    validates :status_id
    validates :genre_id
    validates :postage_id
    validates :region_id
    validates :post_day_id
  end
end
