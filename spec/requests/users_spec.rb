require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user, { name: 'other user' }) }

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

  describe 'before_action: :logged_in_user' do
    context 'when not logged in' do
      it 'redirects edit' do
        get edit_user_path(user)
        expect(flash).not_to be_empty
        expect(response).to redirect_to login_url
      end
      it 'redirects update' do
        patch user_path(user), params: { user: { name: user.name, email: user.email } }
        expect(flash).not_to be_empty
        expect(response).to redirect_to login_url
      end

      it 'redirects index' do
        get users_path
        expect(flash).not_to be_empty
        expect(response).to redirect_to login_url
      end
    end
  end

  describe 'before_action: :correct_user' do
    context 'when logged in as wrong user' do
      before do
        log_in_as(other_user)
      end

      it 'redirects edit' do
        get edit_user_path(user)
        expect(flash).to be_empty
        expect(response).to redirect_to root_url
      end
      it 'redirects update' do
        patch user_path(user), params: { user: { name: user.name, email: user.email } }
        expect(flash).to be_empty
        expect(response).to redirect_to root_url
      end
    end
  end
end
