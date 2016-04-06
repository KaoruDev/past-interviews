Rails.application.routes.draw do
  namespace :api do
    resources :submissions, only: [:create, :show] do
      resources :offers, only: [:index]
    end

    resources :lenders, only: [:index, :show] do
      resources :products, only: [:index, :show]
    end
  end

  root 'application#index'
end
