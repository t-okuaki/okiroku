class User < ApplicationRecord
  has_many :owned_circles, class_name: 'Circle', foreign_key: 'owner_id'

  def circles
    owned_circles
  end
end
