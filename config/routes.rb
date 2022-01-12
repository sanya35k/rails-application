Rails.application.routes.draw do
  get 'carriages/index'
  resources :trains
  resources :railway_stations
  resources :routes
  resources :carriages

  get 'home/index'

  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
