Rails.application.routes.draw do
  resources :homes, only: [:show]

  resources :sites, only: [:index, :show] do
    resources :hives, only: [:show]
  end

  resource :dashboard, only: [:show], :controller => "dashboard"

  namespace :dashboard do
    resources :sites, only: [:new, :create, :edit, :update] do
      resources :hives, only: [:new, :create] do
        resources :logs, only: [:new, :create]
      end
    end
  end

  post ':id/follow_site', to: "relationships#follow_site", as: :follow_site
  post ':id/unfollow_site', to: "relationships#unfollow_site", as: :unfollow_site

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :logout

  root to: 'homes#show'

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get "sites", to: "sites#index"
      get "sites/:id", to: "sites#show"
      get "users/:user_id/sites", to: "users/sites#index"
    end
  end
end
