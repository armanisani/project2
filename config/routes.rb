Rails.application.routes.draw do

  #homes routes
  root 'homes#index'
  get '/show' => 'homes#show'

  #users routes
  get 'users' => 'users#index', as: :users
  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create', as: :create_user
  delete 'users/:id' => 'users#delete'
  patch 'users/:id' => 'users#update'
  get 'users/:id' => 'users#show', as: :show_user
  get 'users/:id/edit' => 'users#edit'
  # resources :users
  #arts
  get 'arts' => 'arts#index', as: :art_index
  get "arts/new" => "arts#new"
  post "arts" => "arts#create", as: :create_art
  patch "arts/:id" => "arts#update"
  get "arts/:id/edit" => "arts#edit"
  get "arts/:id" => "arts#show"
  delete "arts/:id" => "arts#destroy"
  #sessions
  get '/logout' => 'sessions#destroy',as: :logout
  resources :sessions, only: [:new, :create]
end
