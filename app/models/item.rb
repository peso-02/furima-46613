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

  # validations
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: { message: "Info can't be blank" }

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "Scheduled delivery can't be blank" }

  validates :price, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999
                    }
end
