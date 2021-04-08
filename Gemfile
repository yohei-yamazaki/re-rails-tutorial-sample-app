source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bootsnap', '1.7.3', require: false
gem 'jbuilder', '2.11.2'
gem 'puma', '5.2.2'
gem 'rails', '6.1.3.1'
gem 'sass-rails', '6.0.0'
gem 'turbolinks', '5.2.1'
gem 'webpacker', '5.2.1'

group :development, :test do
  gem 'byebug', '11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '6.1.0'
  gem 'rubocop', '~> 0.83', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false # Rails プロジェクトのみ
  gem 'rubocop-rspec', require: false # テストに RSpec を利用するプロジェクトのみ
  gem 'sqlite3', '1.4.2'
end

group :development do
  gem 'listen', '3.5.1'
  gem 'rack-mini-profiler', '2.3.1'
  gem 'spring', '2.1.1'
  gem 'web-console', '4.1.0'
end

group :test do
  gem 'capybara', '3.35.3'
  gem 'rspec-rails', '5.0.1'
  gem 'selenium-webdriver', '3.142.7'
  gem 'webdrivers', '4.6.0'
end

group :production do
  gem 'pg', '1.1.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bcrypt', '3.1.16'
