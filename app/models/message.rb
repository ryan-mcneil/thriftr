class Message < ApplicationRecord

  def self.random
    find(rand(1..Message.count))
  end
end
