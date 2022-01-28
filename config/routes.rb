Rails.application.routes.draw do
  devise_for :users
  root to: "creators#top"
  resources :creators, only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'top'
    end
    member do
      get 'order_menu'
    end
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'user_rooms'
    end
  end
  resources :orders do
    resources :rooms, only: [:index, :new, :create, :show] do
      resources :messages, only: :create
    end
  end
end
