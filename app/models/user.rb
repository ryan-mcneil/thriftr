class User < ApplicationRecord
  validates_presence_of :phone_number, :username
  validates :phone_number, uniqueness: true, length: {is: 10}, numericality: true

  def self.daily_notification_users
    User.where(notifications: true)
  end

end
