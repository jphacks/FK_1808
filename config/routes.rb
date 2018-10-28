Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  get 'groups/index'
  root "static_pages#index"
  resources :schedules, only: [:create]
  resources :groups, only: [:index, :edit, :update, :show]
  resources :users, only: [:edit, :update]
  get "/users/:id/show", to: "users#show", as: :show
  get "/events", to: "schedules#events"
  get "/group/events", to: "groups#groups"
end
