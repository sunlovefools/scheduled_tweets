Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'about#index' , as: 'about-us'
  #get "about" = get request to URL path /about
  #to about#index = redirect to AboutController and perform action index in the AboutController

  get "sign_up", to:'registration#new'
  post "sign_up", to:"registration#create"  

  get "log_in", to:'session#new'
  post "log_in", to:"session#create"  

  get "password", to: 'passwords#edit', as: :update_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"

  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"

  get 'test', to: 'about#hello'
  root to:"main#main"

  delete 'logout', to: 'session#destroy'
end
  