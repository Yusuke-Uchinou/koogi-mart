Rails.application.routes.draw do
  devise_for :users
  root to: "creators#top"
  resources :creators, only: [:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'top'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :orders, only: [:index, :new, :create]
end
