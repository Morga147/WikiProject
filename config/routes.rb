Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :welcome
  resources :categories

  get '/about', to: 'welcome#about'
  get '/login', to: 'users#login'
  post '/login', to: 'users#login_post'
  get '/logout', to: 'users#logout'

  root 'welcome#index'
end
