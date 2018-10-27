Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  root 'pages#index'
  get '/show', to: 'pages#show'
=======
  devise_for :users
  root "static_pages#index"
  resources :schedules, only: [:create]
  get "/events", to: "schedules#events"
>>>>>>> 4eed7e68972b2200824aba91ca27dc2ac13e7dcb
end
