Rails.application.routes.draw do
  namespace :api do
    resources :tickets, param: :code, only: [:create, :show] do
      post 'payments'
    end
  end
end