Rails.application.routes.draw do
  devise_for :users
  root to: "customers#index"
  resources :customers, only: [:index, :new, :create, :show, :destroy] do
    resources :estimates, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end  
  resources :items, only: [:index, :new, :create, :destroy]
  resources :users, only: :show
  resources :posts, only: [:create, :destroy]
end