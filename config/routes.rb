Rails.application.routes.draw do
  resources :airports, only: [:new, :create, :show, :destroy]
  get 'flights/index'
  root 'flights#index'
end
