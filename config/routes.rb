Rails.application.routes.draw do

  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy, :buy] do
    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
    end
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
    resources :profiles, only: [:new, :create] do
      collection do
        get 'show', to: 'profiles#show'
      end
    end
    resources :delivery_destinations, only: [:new, :create] do
      collection do
        get 'edit', to: 'delivery_destinations#edit'
        patch 'update', to: 'delivery_destinations#update'
      end
    end
    member do
      get 'logout'
      get 'credit'
    end
  end
  resources :credit_cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'credit_cards#pay'
    end
  end

  resources :categories, only: [:index, :show]
end