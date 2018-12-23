require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'class methods' do
    it '::random' do
      msg_1 = Message.create(id: 1, text_msg: "message_1")
      msg_2 = Message.create(id: 2, text_msg: "message_2")
      msg_3 = Message.create(id: 3, text_msg: "message_3")
      msg_4 = Message.create(id: 4, text_msg: "message_4")
      msg_5 = Message.create(id: 5, text_msg: "message_5")
      msg_6 = Message.create(id: 6, text_msg: "message_6")
      msg_7 = Message.create(id: 7, text_msg: "message_7")
      msg_8 = Message.create(id: 8, text_msg: "message_8")
      msg_9 = Message.create(id: 9, text_msg: "message_9")


      result_1 = Message.random
      result_2 = Message.random

      expect(result_1).not_to eq(result_2)
    end
  end
end
