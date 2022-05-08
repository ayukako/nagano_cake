class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item


  enum production_status: {"入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4 }

end
