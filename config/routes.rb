Rails.application.routes.draw do
  devise_for :users
  # resources :categories
  # resources :deals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "categories#index"
  resources :users
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :deals, only: [:index, :show, :new, :create, :destroy]
  end

end
