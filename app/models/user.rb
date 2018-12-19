class User < ApplicationRecord
  validates_presence_of :phone_number
  validates :phone_number, uniqueness: true

end
