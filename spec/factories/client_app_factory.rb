# frozen_string_literal: true

FactoryBot.define do
  factory :client_app do
    sequence(:apiKey) { |n| "fake_api_key_#{n}" }
  end
end
