# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Movies", type: :request do
  let(:api_key) { "ABC123" }
  let!(:client_app) { ClientApp.create!(apiKey: api_key) }
  let!(:other_client_app) { ClientApp.create!(apiKey: "other_key") }
  let!(:movie1) { client_app.movies.create!(title: "Space Wars") }
  let!(:movie2) { client_app.movies.create!(title: "Cowboy Wars") }
  let!(:other_movie) { other_client_app.movies.create!(title: "Robot Wars") }

  def date_to_string(date) = date.iso8601(3)

  describe "#index" do
    context "with an invalid API key" do
      it "returns not found" do
        get "/invalid_api_key/movies"
        expect(response.status).to eq(404)
      end
    end

    context "with a valid API key" do
      it "returns all movies for that key" do
        get "/#{api_key}/movies"

        expect(response.status).to eql(200)

        response_body = JSON.parse(response.body)

        expect(response_body).to eq(
          [
            {
              "id" => movie1.id,
              "title" => movie1.title,
              "addedToday" => true # TODO: may error over midnight without freeze_time
            },
            {
              "id" => movie2.id,
              "title" => movie2.title,
              "addedToday" => true
            }
          ]
        )
      end
    end
  end

  describe "#create" do
    title = "Cat Wars"
    body = {title:}
    headers = {"Content-Type" => "application/json"}

    context "with an invalid API key" do
      it "returns not found" do
        expect {
          post "/invalid_api_key/movies", headers:, params: body.to_json
        }.not_to(change { Movie.count })
      end
    end

    context "with a valid API key" do
      it "saves and returns the movie" do
        expect {
          post "/#{api_key}/movies", headers:, params: body.to_json
        }.to change { Movie.count }.by(1)

        movie = Movie.last
        expect(movie.title).to eq(title)

        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body)
        expect(response_body).to eq(
          "id" => movie.id,
          "title" => title,
          "addedToday" => true # TODO: may error over midnight without freeze_time
        )
      end

      it "rejects invalid input" do
        invalid_body = {title: ""}
        expect {
          post "/#{api_key}/movies", headers:, params: invalid_body.to_json
        }.not_to(change { Movie.count })

        expect(response.status).to eq(422)

        response_body = JSON.parse(response.body)
        expect(response_body).to eq(
          "title" => ["can't be blank"]
        )
      end
    end
  end

  describe "#destroy" do
    let!(:movie) { FactoryBot.create(:movie) }

    context "with an invalid API key" do
      it "returns not found" do
        expect {
          delete "/invalid_api_key/movies/#{movie.id}", headers:
        }.not_to(change { Movie.count })
      end
    end

    context "with a valid API key" do
      it "deletes the movie" do
        expect {
          delete "/#{movie.application.apiKey}/movies/#{movie.id}", headers:
        }.to change { Movie.count }.by(-1)

        expect(response.status).to eq(204)
        expect(response.body).to eq("")
      end
    end
  end
end
