class PaymentItem < ApplicationRecord
  belongs_to :payment
  belongs_to :item
  belongs_to :space
  has_many :payment_item_works
end
