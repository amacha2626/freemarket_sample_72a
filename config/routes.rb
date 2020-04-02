Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, except: :index do
    resources :item_images, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :logout] do
    resources :profiles, only: :create
    resources :delivery_destinations, only: [:new, :create, :edit, :update]
    member do
      get 'logout'
      get 'credit'
    end
  end
  resources :categories, only: :index
end
