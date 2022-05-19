Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/bookings/admin', to: 'bookings#admin', as: :admin_bookings
  get '/gears/owner', to: 'gears#owner', as: :owner_gears
  get '/gears/:gear_id/bookings/review', to: 'bookings#review', as: :review_gear_bookings
  get '/gears/:gear_id/bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_gear_booking
  get '/gears/:gear_id/bookings/:id/accept', to: 'bookings#accept', as: :accept_gear_booking

  resources :gears, only: %i[show index new create edit update] do
    resources :bookings, only: %i[new create update]
  end
  resources :bookings, only: %i[index update]

end
