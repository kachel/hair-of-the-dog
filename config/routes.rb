Rails.application.routes.draw do
  resources :user
  root 'user#welcome'
end
