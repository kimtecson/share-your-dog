Rails.application.routes.draw do

  get '/', to: 'pages#home' as :home
  resources :dogs, only: [:show, :index, :create, :new] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index]
end
