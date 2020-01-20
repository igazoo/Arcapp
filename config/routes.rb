Rails.application.routes.draw do

  get 'recommendations/new'
  get 'homes/index'
  get 'homes/about'

  root 'homes#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
      get :recommendation_show
    end
  end

  resources :recommendations

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  resources :groups
  resources :user_groups,only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

end
