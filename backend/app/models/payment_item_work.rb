class PaymentItemWork < ApplicationRecord
  belongs_to :payment_item
  belongs_to :work
end
