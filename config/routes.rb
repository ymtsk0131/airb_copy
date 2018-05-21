Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, only: %i(show edit update destroy)
  resources :rooms, only: %i(new create)
  resources :rooms do
    collection do
      post 'confirm'
    end
  end
  resources :user_images, only: %i(new create destroy)
end
