class Item < ApplicationRecord
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :post_day
end
