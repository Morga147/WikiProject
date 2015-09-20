Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :welcome

  get '/login', to: 'users#login'
  post '/login', to: 'users#login_post'
  get '/logout', to: 'users#logout'

  root 'welcome#index'
end
