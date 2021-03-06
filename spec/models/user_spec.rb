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

  it 'is invalid with too long name' do
    user.name = 'a' * 51
    expect(user).not_to be_valid
  end

  it 'is invalid with too long email' do
    user.email = 'a' * 244 + '@example.com'
    expect(user).not_to be_valid
  end

  it 'is accept valid addresses' do
    valid_addresses = %w[user@exmaple.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid, "#{valid_address.inspect} is valid"
    end
  end

  it 'reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]

    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).not_to be_valid, "#{invalid_address.inspect} is invalid"
    end
  end

  it 'is valid with unique email address' do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).not_to be_valid
  end

  it 'saved email as lower-case' do
    user.email = user.email.upcase
    user.save
    user.reload
    expect(user.email).to eq user.email.downcase
  end

  it 'invalid with blank password' do
    user.password = user.password_confirmation = ' ' * 6
    expect(user).not_to be_valid
  end

  it 'invalid with less than 6 letters' do
    user.password = user.password_confirmation = 'a' * 5
    expect(user).not_to be_valid
  end

  it 'return false with authenticated? for a user with nil digest' do
    expect(user.authenticated?(:remember, '')).to be_falsy
  end
end
