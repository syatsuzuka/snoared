Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gears, only: [ :show ]
  resource :bookings, only: [ :index, :update, :create ]
end
