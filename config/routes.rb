Rails.application.routes.draw do
  resources :airports, only: [:new, :create, :show, :destroy]
  resources :flights

  root 'flights#index'
end
