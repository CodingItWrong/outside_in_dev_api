# frozen_string_literal: true

require 'rails_helper'

describe ClientApp do
  subject(:client_app) { FactoryBot.create(:client_app) }

  describe '#create_sample_data!' do
    it 'creates some sample restaurants' do
      expect {
        client_app.create_sample_data!
      }.to change { client_app.restaurants.count }.by(2)
    end

    it 'creates some sample movies' do
      expect {
        client_app.create_sample_data!
      }.to change { client_app.movies.count }.by(2)

      expect(client_app.movies.first.added_today).to eq(false)
      expect(client_app.movies.last.added_today).to eq(false)
    end
  end
end
