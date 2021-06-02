Rails.application.routes.draw do
  devise_for :users
  resources :customers, only: :index
end
