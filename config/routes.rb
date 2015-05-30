Rails.application.routes.draw do

  concern :paginatable do
  get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :movies, concerns: :paginatable do
    resources :reviews, :concerns => :paginatable
  end
  namespace :admin do
    resources :users, concerns: :paginatable
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root 'movies#index'

end
