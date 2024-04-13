Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root 'static_pages#home'
  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts, only: [:create, :destroy]
  get '/microposts', to: 'static_pages#home'
end
