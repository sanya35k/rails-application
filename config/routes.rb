Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root 'searches#show'

  namespace :admin do

    resources :tickets

    resources :trains do
      resources :tickets
      resources :carriages
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_station_time, on: :member
    end

    resources :routes
    resources :carriages
  end

  resources :routes, only: [] do
    get :search_route, on: :collection
    get :trains_on_route, on: :member
  end

  resources :tickets, only: [:index, :destroy]

  resources :trains, only: [] do
    resources :tickets, only: [:new, :create, :show]
  end

  resource :search, only: %i[new show edit]
end
