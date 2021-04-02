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

    it "should show title 'Home | Ruby on Rails Tutorial Sample App'" do
      puts "response: #{response.body}"
      expect(response.body).to include('Home | Ruby on Rails Tutorial Sample App')
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
      expect(response.body).to include('Help | Ruby on Rails Tutorial Sample App')
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
      expect(response.body).to include('About | Ruby on Rails Tutorial Sample App')
    end
  end
end
