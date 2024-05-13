Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/create'
  get 'dogs/index'
  get 'dogs/show'
  get 'dogs/create'
  get 'dogs/new'
  get 'users/index'
  get 'users/show'
  get 'users/bookings'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
