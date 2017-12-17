Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/top_ten', to: 'static#top_ten'
  resources :things
  resources :users
  resources :votes

  get 'thing/:id', to: 'things#show', as: 'thing_path'
  root 'static#random'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/complete', to: 'static#complete'


end
