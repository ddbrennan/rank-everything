Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'things/top_ten', to: 'things#top_ten'
  resources :things
  resources :users
  resources :votes

  get 'thing/:id', to: 'things#show', as: 'thing_path'
  root 'things#random'
  post 'things/random', to: 'things#vote'

end
