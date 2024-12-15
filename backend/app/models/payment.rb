class Payment < ApplicationRecord
  belongs_to :circle
  has_many :payment_items, -> { order(:created_at) }

  validates :price, presence: true
end
