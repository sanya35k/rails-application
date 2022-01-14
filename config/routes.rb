Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :trains do
    resources :tickets
    resources :carriages
  end

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_station_time, on: :member
  end

  resources :routes do
    get :search_route, on: :collection
    get :trains_on_route, on: :member
  end

  resources :carriages

  resource :search, only: %i[new show edit]
end
