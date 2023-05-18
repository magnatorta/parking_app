Rails.application.routes.draw do
  namespace :api do
    resources :tickets, param: :code, only: [:create, :show]
  end
end