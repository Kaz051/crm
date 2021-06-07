Rails.application.routes.draw do
  devise_for :users
  root to: "customers#index"
  resources :customers, only: [:index, :new, :create, :show] do
    resources :estimates, only: :create
    resource :bookmarks, only: [:create, :destroy]
  end  
  resources :items, only: [:index, :new, :create]
  resources :users, only: :show
end