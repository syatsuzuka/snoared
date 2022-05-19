Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/gears/owner', to: 'gears#owner', as: :owner_gears
  get '/bookings/admin', to: 'bookings#admin', as: :admin_bookings
  get '/gears/:gear_id/bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_gear_booking

  resources :gears, only: [ :show, :index, :new, :create ] do
    resources :bookings, only: [ :new, :create, :update ]
  end
  resources :bookings, only: [ :index, :update ]

end
