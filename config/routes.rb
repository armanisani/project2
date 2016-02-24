Rails.application.routes.draw do

  #homes routes
  root 'homes#index'
  get '/show' => 'homes#show'

  #users routes
  get 'users' => 'users#index', as: :users
  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create', as: :create_user
  delete 'users/:id' => 'users#delete',as: :destroy_user
  patch 'users/:id/edit' => 'users#update'
  get 'users/:id' => 'users#show', as: :show_user
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  # resources :users
  #arts
  get 'arts' => 'arts#index', as: :art_index
  get "arts/new" => "arts#new"
  post "arts" => "arts#create", as: :create_art
  patch "arts/:id/edit" => "arts#update"
  get "arts/:id/edit" => "arts#edit", as: :edit_art
  get "arts/:id" => "arts#show"
  delete "arts/:id" => "arts#delete",as: :destroy_art
  #sessions
  get '/logout' => 'sessions#destroy',as: :logout
  resources :sessions, only: [:new, :create]
end
