Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  get "/get_current_user", to: "sessions#get_current_user"
  delete "/logout", to: "sessions#destroy"
  resources :decisions
  resources :searches
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
