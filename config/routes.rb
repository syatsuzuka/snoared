Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/gears/owned', to: 'gears#owned', as: :owned_gears
  get '/admin/bookings/', to: 'bookings#all', as: :admin_bookings

  resources :gears, only: [ :show, :index, :new, :create ] do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: [ :index, :update ]

end
