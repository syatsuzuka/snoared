Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gears, only: [ :show, :index ] do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [ :index, :update ]
end
