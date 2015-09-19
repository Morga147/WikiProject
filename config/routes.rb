Rails.application.routes.draw do
  resources :posts
  resources :users

  get '/login', to: 'users#login'
  post '/login', to: 'users#login_post'
  get '/logout', to: 'users#logout'

  root 'posts#index'
end
