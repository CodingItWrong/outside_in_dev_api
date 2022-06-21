# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    application factory: :client_app
    sequence(:name) { |n| "Restaurant #{n}" }
  end
end
