Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: "users#new"

  get '/login', to: "sessions#new"

  get '/auth/twitter', as: "twitter_login"
  get '/auth/twitter/callback', to: "sessions#create"
end
