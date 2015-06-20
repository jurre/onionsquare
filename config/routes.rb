Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  resources :products
  resources :merchant, only: [:new, :create]

end
