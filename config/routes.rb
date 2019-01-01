Rails.application.routes.draw do
  resources :users

  get 'ratings/create'
  get 'comments/create'

  resources :recipes do
    resources :ratings
    resources :comments
  end

  root 'users#welcome'
  get '/auth/:provider/callback' =>'sessions#create'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
end
