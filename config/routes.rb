Rails.application.routes.draw do
  resources :bookings
  get 'flights/index'
  root 'flights#index'
end
