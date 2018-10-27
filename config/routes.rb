Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    post '/callback', to: 'webhook#callback'

  devise_for :users
  root "static_pages#index"
  resources :schedules, only: [:create]
  get "/events", to: "schedules#events"
end
