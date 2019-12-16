Rails.application.routes.draw do

  get 'homes/index'
  get 'homes/about'

  root 'homes#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :events
  resources :rooms


  resources :groups
  resources :user_groups,only: [:create, :destroy]


   mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
