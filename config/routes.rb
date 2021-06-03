Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "customers#index"
  resources :customers, only: [:index, :new, :create, :show]
  resources :items, only: [:index, :new, :create]
  resources :users, only: :show
end