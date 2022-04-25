class Item < ApplicationRecord

  has_many :cart_item, dependent: :destroy
  has_many :order_detail
  belongs_to :genre
end
