Rails.application.routes.draw do
  resources :users, only: [:create, :show, :update, :destroy]
  resources :books
  resources :book_clubs do
    resources :memberships, only: [:create, :destroy]
    resources :discussions, only: [:index, :create, :destroy]
    resources :events
  end
  resources :reviews, only: [:create, :index, :show, :update, :destroy]
  resources :notifications, only: [:index, :update, :create]

  # Custom routes for authentication
  post '/login', to: 'users#login'
  get '/profile', to: 'users#profile'
end
