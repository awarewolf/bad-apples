Rails.application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  namespace :admin do
    resources :users
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root 'movies#index'

end
