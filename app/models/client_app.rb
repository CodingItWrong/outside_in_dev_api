# frozen_string_literal: true

class ClientApp < ApplicationRecord
  self.table_name = 'applications'

  has_many :restaurants, foreign_key: :application_id
  has_many :movies, foreign_key: :application_id

  def create_sample_data!
    restaurants.create([
                         { name: 'Pasta Place' },
                         { name: 'Salad Place' },
                       ])
    movies.create([
                    { title: 'Space Wars', created_at: 2.days.ago },
                    { title: 'Cowboy Wars', created_at: 2.days.ago },
                  ])
  end
end
