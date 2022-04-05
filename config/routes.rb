Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  resources :users do
    resources :messages
  end
  root 'rooms#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
end