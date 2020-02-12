Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/index'
  resources :users

  get '/signin', to: 'users#index'

  get '/category', to: 'users#menu'
  
  post '/signin', to: 'users#signin'

  post '/category', to: 'users#category'

  delete '/logout', to: 'users#logout'

  root "users#index"
end
