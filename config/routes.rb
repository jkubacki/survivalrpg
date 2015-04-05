Rails.application.routes.draw do
  resources :encounters
  resources :places
  devise_for :users
  root to: 'places#index'
end
