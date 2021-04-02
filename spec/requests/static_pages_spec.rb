# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do

  describe 'GET /static_pages/home' do
    before do
      get static_pages_home_path
    end

    it 'should get home' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /static_pages/help' do
    before do
      get static_pages_help_path
    end

    it 'should get help' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /static_pages/about' do
    before do
      get static_pages_about_path
    end

    it 'should get about' do
      expect(response).to have_http_status(200)
    end
  end
end
