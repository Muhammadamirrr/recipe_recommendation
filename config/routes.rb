Rails.application.routes.draw do
  resources :sessions, only: %i[new create]
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :users, only: %i[new create]

  root 'recipes#index'
end
