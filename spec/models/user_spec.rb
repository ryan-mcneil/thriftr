require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it { should validate_presence_of :phone_number }
    it { should validate_uniqueness_of :phone_number }
    it { should validate_presence_of :username }
  end
end
