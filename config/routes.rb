Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  # resources :categories
  # resources :deals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :splash, only: %i[index]
  resources :users
  root "splash#index"
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :deals, only: [:index, :new, :create ]
  end

end
