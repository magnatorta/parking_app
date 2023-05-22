Rails.application.routes.draw do
  namespace :api do
    resources :tickets, param: :code, only: [:create, :show] do
      resources :payments, only: :create
      get 'state'
    end

    resources :free_spaces, path: 'free-spaces', only: :index
  end
end