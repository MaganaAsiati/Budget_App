Rails.application.routes.draw do
  devise_for :users
  resources :deals
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :categories, only: [:index, :show, :new, :create] do
      resources :deals, only: [:index, :show, :new, :create]
    end
  end

  # Defines 
  # Defines the root path route ("/")
  root "users#splash_screen"
end
