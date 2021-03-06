class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name
    validates :comment
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :shipping_date_id
  end
end
