Rails.application.routes.draw do
  root "sessions#new"

  get  "login",  to: "sessions#new",     as: :login
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get "dashboard", to: "dashboard#index", as: :dashboard

  resources :tables, only: [:index]
  resources :reservations, only: [:index, :new, :create, :destroy]
end
