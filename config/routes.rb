Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  resources :products do
    resources :payments, only: [:new, :create]
  end

  resources :merchants, only: [:new, :create]
  resources :thanks, only: [:index]
  resources :users, only: [:show]
end
