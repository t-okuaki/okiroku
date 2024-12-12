class Circle < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :spaces
  has_many :works
  has_many :payments
end
