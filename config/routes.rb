Rails.application.routes.draw do

  get 'homes/index'
  root 'homes#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
