Rails.application.routes.draw do
  devise_for :users
  root to: "creators#top"
  resources :creators, only: [:index, :new, :create] do
    collection do
      get 'top'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
