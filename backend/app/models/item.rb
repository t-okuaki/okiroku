class Item < ApplicationRecord
  belongs_to :space
  has_many :item_works
  has_many :works, through: :item_works
end
