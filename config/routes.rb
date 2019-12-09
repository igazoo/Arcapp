Rails.application.routes.draw do

  get 'rooms/show'
  get 'events/new'
  get 'sessions/new'
  get 'homes/index'
  get 'homes/about'
  get 'events/index'
  root 'homes#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :events
  resources :rooms do
    member do
      get "detail"
    end
  end
   mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
