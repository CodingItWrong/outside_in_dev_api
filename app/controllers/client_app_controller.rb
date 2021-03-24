class ClientAppController < ApplicationController
  def create
    api_key = SecureRandom.alphanumeric(32)
    @app = ClientApp.create(apiKey: api_key)
    if @app.save
      # TODO: protect this from errors too
      @app.create_sample_data!
      render :create
    else
      render :new
    end
  end
end
