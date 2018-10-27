Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  get 'groups/index'
  root "static_pages#index"
  resources :schedules, only: [:create]
  resources :groups, only: [:index]
  resources :users, only: [:edit, :update]
  get "/events", to: "schedules#events"
  get "/groups/events", to: "groups#groups"
end
