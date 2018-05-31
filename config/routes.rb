Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, only: %i(show edit update destroy)
  resources :rooms
  resources :room_images, only: %i(new create)
  resources :user_images, only: %i(new create destroy)
end
