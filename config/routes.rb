Rails.application.routes.draw do
  root to: "home#index"

  get :map, to: "home#map" 

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  resources :products do
    resources :payments, only: [:new, :create]
    resources :comments, only: [:create]
  end

  resources :merchants, only: [:new, :create]
  resources :thanks, only: [:index]
  resources :users, only: [:show]
end
