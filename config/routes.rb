Rails.application.routes.draw do
  get 'ratings/create'
  get 'comments/create'
  resources :users
  resources :recipes
  root 'users#welcome'
  get '/auth/:provider/callback' =>'sessions#create'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
end
