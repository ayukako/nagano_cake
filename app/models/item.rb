class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_details
  belongs_to :genre
end
