require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  let(:api_key) { 'ABC123' }
  let!(:client_app) { ClientApp.create!(apiKey: api_key) }
  let!(:other_client_app) { ClientApp.create!(apiKey: 'other_key') }
  let!(:restaurant1) { client_app.restaurants.create!(name: 'Pizza Place') }
  let!(:restaurant2) { client_app.restaurants.create!(name: 'Salad Place') }
  let!(:other_restaurant) { other_client_app.restaurants.create!(name: 'Other Place') }

  def date_to_string(date) = date.iso8601(3)

  describe '#index' do
    context 'with an invalid API key' do
      it 'returns not found' do
        get '/invalid_api_key/restaurants'
        expect(response.status).to eq(404)
      end
    end

    context 'with a valid API key' do
      it 'returns all restaurants for that key' do
        get "/#{api_key}/restaurants"

        expect(response.status).to eql(200)

        response_body = JSON.parse(response.body)

        expect(response_body).to eq([
                                      {
                                        'id' => restaurant1.id,
                                        'name' => restaurant1.name
                                      },
                                      {
                                        'id' => restaurant2.id,
                                        'name' => restaurant2.name
                                      }
                                    ])
      end
    end
  end

  describe '#create' do
    name = 'Burger Place'
    body = { name: }
    headers = { 'Content-Type' => 'application/json' }

    context 'with an invalid API key' do
      it 'returns not found' do
        expect {
          post '/invalid_api_key/restaurants', headers:, params: body.to_json
        }.not_to(change { Restaurant.count })
      end
    end

    context 'with a valid API key' do
      it 'saves and returns the restaurant' do
        expect {
          post "/#{api_key}/restaurants", headers:, params: body.to_json
        }.to change { Restaurant.count }.by(1)

        restaurant = Restaurant.last
        expect(restaurant.name).to eq(name)

        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body)
        expect(response_body).to eq(
          'id' => restaurant.id,
          'name' => name
        )
      end

      it 'rejects invalid input' do
        invalid_body = { name: '' }
        expect {
          post "/#{api_key}/restaurants", headers:, params: invalid_body.to_json
        }.not_to(change { Restaurant.count })

        expect(response.status).to eq(422)

        response_body = JSON.parse(response.body)
        expect(response_body).to eq(
          'name' => ["can't be blank"]
        )
      end
    end
  end

  describe '#destroy' do
    let!(:restaurant) { FactoryBot.create(:restaurant) }

    context 'with an invalid API key' do
      it 'returns not found' do
        expect {
          delete "/invalid_api_key/restaurants/#{restaurant.id}", headers:
        }.not_to(change { Restaurant.count })
      end
    end

    context 'with a valid API key' do
      it 'deletes the restaurant' do
        expect {
          delete "/#{restaurant.application.apiKey}/restaurants/#{restaurant.id}", headers:
        }.to change { Restaurant.count }.by(-1)

        expect(response.status).to eq(204)
        expect(response.body).to eq('')
      end
    end
  end
end
