# frozen_string_literal: true

class ClientApp < ApplicationRecord
  self.table_name = "applications"

  has_many :restaurants, foreign_key: :application_id
  has_many :movies, foreign_key: :application_id

  def create_sample_data! # rubocop:disable Metrics/MethodLength
    restaurants.create(
      [
        {name: "Pasta Place"},
        {name: "Salad Place"}
      ]
    )
    movies.create(
      [
        {title: "Vertigo", created_at: 2.days.ago},
        {title: "The Sound of Music", created_at: 2.days.ago}
      ]
    )
  end
end
