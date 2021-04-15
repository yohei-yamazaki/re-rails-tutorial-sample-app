require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { FactoryBot.build(:user, name: 'Example User') }

  before do
    remember(user)
  end

  describe 'current_user' do
    it 'returns right user when session is nil' do
      expect(user).to eq current_user
      expect(is_logged_in?).to be_truthy
    end

    it 'returns nil when remember digest is wrong' do
      user.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to be nil
    end
  end
end
