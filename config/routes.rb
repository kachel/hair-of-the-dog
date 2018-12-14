Rails.application.routes.draw do
  resources :users
  resources :recipes
  root 'users#welcome'
  get '/auth/:provider/callback' =>'sessions#create'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
end
