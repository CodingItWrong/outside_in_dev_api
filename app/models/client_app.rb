# frozen_string_literal: true

class ClientApp < ApplicationRecord
  self.table_name = 'applications'

  has_many :restaurants, foreign_key: :application_id

  def create_sample_data!
    restaurants.create([
                         { name: 'Pasta Place' },
                         { name: 'Salad Place' }
                       ])
  end
end
