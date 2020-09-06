Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  get "/get_current_user", to: "sessions#get_current_user"
  post "/search_results", to: "searches#search_results"
  delete "/logout", to: "sessions#destroy"
  resources :searches, except: [:show]
  resources :users, only: [:create]
end
