Rails.application.routes.draw do
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: %i[new create]
  resources :users, only: %i[new create]
  resources :recipes, only: %i[index show]

  root 'recipes#index'
end
