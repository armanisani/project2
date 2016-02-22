Rails.application.routes.draw do

  #homes routes
  root 'homes#index'
  get '/show' => 'homes#show'

  #users routes
  get 'users/' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  delete 'users/:id' => 'users#delete'
  patch 'users/:id' => 'users#update'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  #arts
  get 'arts' => 'arts#index'
  get "arts/new" => "arts#new"
  post "arts" => "arts#create"
  patch "arts/:id" => "arts#update"
  get "arts/:id/edit" => "arts#edit"
  get "arts/:id" => "arts#show"
  delete "arts/:id" => "arts#destroy"
  #sessions
  get '/logout' => 'sessions#destroy',as: :logout
  resources :sessions, only: [:new, :create]
end
