class Work < ApplicationRecord
  belongs_to :circle
  has_many :space_works
  has_many :spaces, through: :space_works
  has_many :item_works
  has_many :items, through: :item_works
end
