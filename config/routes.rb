Rails.application.routes.draw do
  root to: 'client_app#new'
  post '/applications', to: 'client_app#create'
  get '/:api_key/restaurants', to: 'restaurants#index'
  post '/:api_key/restaurants', to: 'restaurants#create'
  delete '/:api_key/restaurants/:id', to: 'restaurants#destroy'
end
