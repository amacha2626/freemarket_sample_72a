Rails.application.routes.draw do
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  get 'card/new'

  get 'card/show'
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy, :buy] do
    resources :item_images, only: [:create, :destroy]
    member do
      get 'buy'
    end
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:show, :edit, :update, :logout] do
    resources :profiles, only: [:new, :create, :show]
    resources :delivery_destinations, only: [:new, :create, :edit, :update]
    member do
      get 'logout'
      get 'credit'
    end
    resources :credit_cards, only: [:new, :create, :show, :edit, :destroy] do
      collection do
        post 'delete', to: 'credit_cards#delete'
        post 'show'
      end
      member do
        get 'confirmation'
      end
    end 
  end
  resources :categories, only: :index
end