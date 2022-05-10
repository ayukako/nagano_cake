class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  def total_payment

  end

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting:0, confirmation:1, making:2, packing:3, sended:4 }
end
