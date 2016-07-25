Rails.application.routes.draw do
  resources :homes, only: [:show]

  root to: 'homes#show'
end
