class Payment < ApplicationRecord
  belongs_to :circle
  has_many :payment_items
end