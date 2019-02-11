Rails.application.routes.draw do
  resources :users

  # must be above dynamic recipes routes, otherwise it interprets
  # servings as an id
  get '/recipes/servings', to: 'recipes#servings', as: 'servings'

  get 'ratings/create'
  get 'comments/create'

  resources :recipes do
    resources :ratings
    resources :comments
  end

  resources :ingredients

  root 'users#welcome'
  get '/auth/:provider/callback' =>'sessions#create'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
end
