Rails.application.routes.draw do
  get 'groups/index'
  devise_for :users
  root "static_pages#index"
  resources :schedules, only: [:create]
  resources :groups, only: [:index, :edit, :update]
  resources :users, only: [:edit, :update]
  get "/events", to: "schedules#events"
  get "/groups/events", to: "groups#groups"
end
