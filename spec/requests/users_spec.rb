require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user, { name: 'other user' }) }
  let!(:admin) { FactoryBot.create(:admin) }

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

  describe 'PATCH /users/:id/edit' do
    it 'does not allow the admin attribute to be edited via the web' do
      log_in_as(other_user)
      expect(other_user.admin?).to be_falsy
      patch user_path(other_user), params: {
        user: { password: 'password', password_confirmation: 'password', admin: true }
      }
      expect(other_user.reload.admin?).to be_falsy
    end
  end

  describe 'DELETE /users/:id' do
    it 'delete user count' do
      log_in_as(admin)
      expect { delete(user_path(user)) }.to change(User, :count).by(-1)
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

      it 'redirects destroy' do
        expect { delete(user_path(user)) }.not_to change(User, :count)
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

  describe 'before_action: :admin_user' do
    context 'when logged in not admin user' do
      it 'redirects destroy' do
        log_in_as(other_user)
        expect { delete(user_path(user)) }.not_to change(User, :count)
        expect(response).to redirect_to root_url
      end
    end
  end
end
