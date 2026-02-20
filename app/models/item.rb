class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # associations
  belongs_to :user
  has_one :order

  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :shipping_day
end
