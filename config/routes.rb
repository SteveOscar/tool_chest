Rails.application.routes.draw do
  resources :tools, only: [:show, :index]
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :tools
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'
  root 'tools#index'
end
