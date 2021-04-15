# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Aaron' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end
