# frozen_string_literal: true

class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_app

  def index
    sleep 1 unless Rails.env.test?
    render json: @app.movies.all.map(&:to_json)
  end

  def create
    sleep 1 unless Rails.env.test?
    @restaurant = @app.movies.create(movie_params)
    if @restaurant.save
      render json: @restaurant.to_json
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    sleep 1 unless Rails.env.test?
    @restaurant = @app.movies.find(params[:id])
    @restaurant.destroy!
    head :no_content
  end

  private

  def set_app
    @app = ClientApp.find_by(apiKey: params[:api_key])
    head :not_found unless @app
  end

  def movie_params
    params.permit(:title)
  end
end
