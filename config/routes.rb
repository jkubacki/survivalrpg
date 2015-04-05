Rails.application.routes.draw do
  resources :encounters
  resources :places
  devise_for :users
  root to: 'games#new'
  get 'games/new'
  post 'games/draw'
  get 'games/reward'
end
