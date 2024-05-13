Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :dogs, only: [:show, :index, :create, :new] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index]

  namespace :owner do
    resources :bookings, only: :index
  end
end
