# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    application factory: :client_app
    sequence(:title) { |n| "Movie #{n}" }
  end
end
