class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item


  enum production_status: { waiting:0, confirmation:1, making:2, packing:3, sended:4 }

end
