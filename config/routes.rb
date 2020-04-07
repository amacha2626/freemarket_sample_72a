Rails.application.routes.draw do
  get 'card/new'

  get 'card/show'

  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy, :buy] do
    resources :item_images, only: [:create, :destroy]
    member do
      get 'buy'
    end
  end
  resources :users, only: [:show, :edit, :update, :logout] do
    resources :profiles, only: [:new, :create]
    resources :delivery_destinations, only: [:new, :create, :edit, :update]
    member do
      get 'logout'
      get 'credit'
    end
  end
  resources :categories, only: :index
end