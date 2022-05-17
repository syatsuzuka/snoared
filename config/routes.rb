Rails.application.routes.draw do
  get 'bookings/', to: 'bookings#index'
  get 'bookings/update'
  get 'bookings/create'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
