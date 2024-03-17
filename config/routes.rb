Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :posts
  resources :categories
  resources :users
  resources :roles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root 'posts#index', as: 'home'
  # root 'home#index', as: 'home'
  root 'categories#index', as: 'home'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
