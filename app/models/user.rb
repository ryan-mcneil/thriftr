class User < ApplicationRecord
  validates_presence_of :phone_number, :username
  validates :phone_number, uniqueness: true

end
