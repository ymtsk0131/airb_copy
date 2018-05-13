Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, only: %i(show edit update destroy)
end
