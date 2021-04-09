require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  describe 'GET /users/:id' do
    it 'should get show' do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/new' do
    it 'should get new' do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end
end
