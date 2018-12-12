Rails.application.routes.draw do
  resources :users
  root 'users#welcome'
  get '/auth/:provider/callback' =>'sessions#create'
end
