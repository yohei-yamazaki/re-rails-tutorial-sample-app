# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  describe 'GET /' do
    before do
      get root_url
    end

    it 'should get root' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /static_pages/home' do
    before do
      get static_pages_home_path
    end

    it 'should get home' do
      expect(response).to have_http_status(200)
    end

    it "should show title 'Ruby on Rails Tutorial Sample App'" do
      expect(response.body).to include(base_title)
      expect(response.body).not_to include(" | #{base_title}")
    end
  end

  describe 'GET /static_pages/help' do
    before do
      get static_pages_help_path
    end

    it 'should get help' do
      expect(response).to have_http_status(200)
    end

    it "should show title 'Help | Ruby on Rails Tutorial Sample App'" do
      expect(response.body).to include("Help | #{base_title}")
    end
  end

  describe 'GET /static_pages/about' do
    before do
      get static_pages_about_path
    end

    it 'should get about' do
      expect(response).to have_http_status(200)
    end

    it "should show title 'About | Ruby on Rails Tutorial Sample App'" do
      expect(response.body).to include("About | #{base_title}")
    end
  end

  describe 'GET /static_pages/contact' do
    before do
      get static_pages_contact_path
    end

    it 'should get contact' do
      expect(response).to have_http_status(200)
    end

    it "should show title 'Contact | Ruby on Rails Tutorial Sample App'" do
      expect(response.body).to include("Contact | #{base_title}")
    end
  end
end
