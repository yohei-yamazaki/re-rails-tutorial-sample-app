require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user, name: 'Example User') }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without name' do
    user.name = '  '
    expect(user).not_to be_valid
  end

  it 'is invalid without email' do
    user.email = '  '
    expect(user).not_to be_valid
  end
end
