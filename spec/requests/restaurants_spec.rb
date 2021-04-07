require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  let(:api_key) { 'ABC123' }
  let!(:client_app) { ClientApp.create!(apiKey: api_key) }

  it 'allows retrieving all restaurants' do
    client_app.restaurants.create!(name: 'Pizza Place')
    client_app.restaurants.create!(name: 'Salad Place')

    get "/#{api_key}/restaurants"

    expect(response.status).to eql(200)

    response_body = JSON.parse(response.body)
    expect(response_body.count).to eql(2)
    expect(response_body[0]['name']).to eql('Pizza Place')
    expect(response_body[1]['name']).to eql('Salad Place')
  end

  it 'allows creating a restaurant' do
    headers = {'Content-Type' => 'application/json'}

    name = 'Burger Place'
    body = { name: name }

    post "/#{api_key}/restaurants", headers: headers, params: body.to_json

    expect(response.status).to eq(200)

    response_body = JSON.parse(response.body)
    expect(response_body['name']).to eql(name)
  end
end
