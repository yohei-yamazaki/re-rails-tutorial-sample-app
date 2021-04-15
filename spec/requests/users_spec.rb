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

  describe 'Get /users/:id/edit' do
    context 'not logged in' do
      it 'redirect edit' do
        get edit_user_path(user)
        expect(flash).not_to be_empty
        expect(response).to redirect_to login_url
      end
    end
  end

  describe 'Patch /users/:id' do
    context 'not logged in' do
      it 'redirect update' do
        patch user_path(user), params: { user: { name: user.name, email: user.email } }
        expect(flash).not_to be_empty
        expect(response).to redirect_to login_url
      end
    end
  end
end
