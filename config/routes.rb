Rails.application.routes.draw do
  namespace :api do
    resources :tickets, only: [:index, :create]
  end
end
