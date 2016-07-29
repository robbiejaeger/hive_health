Rails.application.routes.draw do
  resources :homes, only: [:show]

  resources :sites, only: [:index, :show]

  resource :dashboard, only: [:show], :controller => "dashboard"

  namespace :dashboard do
    resources :sites, only: [:new, :create, :edit, :update]
  end

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :logout

  root to: 'homes#show'

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get "sites", to: "sites#index"
      get "users/:user_id/sites", to: "users/sites#index"
    end
  end
end
