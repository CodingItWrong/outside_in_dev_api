class RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_app

  def index
    sleep 1
    render json: @app.restaurants.all
  end

  def create
    sleep 1
    @restaurant = @app.restaurants.create(restaurant_params)
    if @restaurant.save
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  private

  def set_app
    @app = ClientApp.find_by(api_key: params[:api_key])
    unless @app
      head :not_found
    end
  end

  def restaurant_params
    params.permit(:name)
  end
end
