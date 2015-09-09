Rails.application.routes.draw do

  resources :users, except: [:destroy] 
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
  get "/checkins", to: "checkins#show"
  resources :checkins

  # contacts routes
  resources :contacts, except: [:index]
  
  root "pages#home"
end

# Prefix Verb   URI Pattern                  Controller#Action
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#       signup GET    /signup(.:format)            users#new
#      profile GET    /profile(.:format)           users#show
#         news GET    /news(.:format)              pages#news
#        login GET    /login(.:format)             sessions#new
#       logout GET    /logout(.:format)            sessions#destroy
#     sessions GET    /sessions(.:format)          sessions#index
#              POST   /sessions(.:format)          sessions#create
#  new_session GET    /sessions/new(.:format)      sessions#new
# edit_session GET    /sessions/:id/edit(.:format) sessions#edit
#      session GET    /sessions/:id(.:format)      sessions#show
#              PATCH  /sessions/:id(.:format)      sessions#update
#              PUT    /sessions/:id(.:format)      sessions#update
#              DELETE /sessions/:id(.:format)      sessions#destroy
#     checkins GET    /checkins(.:format)          checkins#index
#              POST   /checkins(.:format)          checkins#create
#  new_checkin GET    /checkins/new(.:format)      checkins#new
# edit_checkin GET    /checkins/:id/edit(.:format) checkins#edit
#      checkin GET    /checkins/:id(.:format)      checkins#show
#              PATCH  /checkins/:id(.:format)      checkins#update
#              PUT    /checkins/:id(.:format)      checkins#update
#              DELETE /checkins/:id(.:format)      checkins#destroy
#     contacts POST   /contacts(.:format)          contacts#create
#  new_contact GET    /contacts/new(.:format)      contacts#new
# edit_contact GET    /contacts/:id/edit(.:format) contacts#edit
#      contact GET    /contacts/:id(.:format)      contacts#show
#              PATCH  /contacts/:id(.:format)      contacts#update
#              PUT    /contacts/:id(.:format)      contacts#update
#              DELETE /contacts/:id(.:format)      contacts#destroy
#         root GET    /                            pages#home
