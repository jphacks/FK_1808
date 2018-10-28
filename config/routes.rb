Rails.application.routes.draw do
  get 'groups/index'
  devise_for :users
  root "static_pages#index"
  resources :schedules, only: [:create]
  resources :groups, only: [:index, :edit, :update, :show]
  resources :users, only: [:edit, :update]
  get "/events", to: "schedules#events"
  get "/group/events", to: "groups#groups"
end
