class Space < ApplicationRecord
  belongs_to :circle
  has_many :space_works
  has_many :works, through: :space_works
  has_many :items
end
