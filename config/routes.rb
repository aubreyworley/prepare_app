Rails.application.routes.draw do

   # users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"

  get "/news", to: "pages#news"

  # sessions routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  # post "/sessions", to: "sessions#create"
  resources :sessions

  # checkins routes
  get "/checkins/edit", to: "checkins#edit"
  post "/checkins/edit", to: "checkins#update"
  put '/checkins/edit', to: "checkins#update"
  delete "/checkins/destroy", to: "checkins#destroy"
  resources :checkins, except: [:index]

  # contacts routes
  get "/contacts/edit", to: "contacts#edit"
  post "/contacts/edit", to: "contacts#update"
  put '/contacts/edit', to: "contacts#update"
  delete "/contacts/destroy", to: "contacts#destroy"
  resources :contacts, except: [:index]
  
  root "pages#home"
end

