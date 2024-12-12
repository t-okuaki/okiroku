class PaymentItem < ApplicationRecord
  belongs_to :payment
  belongs_to :item, optional: true
  belongs_to :space, optional: true
  has_many :payment_item_works
end
