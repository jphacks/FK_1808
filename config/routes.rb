Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  root 'static_pages#index'
  get '/show', to: 'static_pages#show_user'
  get '/edit', to: 'static_pages#edit_user'
end
