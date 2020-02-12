Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :body_mass_categories
  
  get '/signin', to: 'users#index'

  get '/category', to: 'body_mass_categories#index'
  
  post '/signin', to: 'users#signin'

  post '/category', to: 'body_mass_categories#create'

  delete '/logout', to: 'users#logout'

  root "users#index"
end
