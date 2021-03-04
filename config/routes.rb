Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show_id"
  # get "/" => "home#index"
  # root :to => "/"
  # get "/" => "home#index"
  # redirect to root path
  resources :todos
  resources :users
  get "/" => "home#index", as: :home
  post "users/login", to: "users#login"
end
