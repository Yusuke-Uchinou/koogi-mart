Rails.application.routes.draw do
  devise_for :users
  root to: "creators#top"
  resources :creators, only: :index do
    collection do
      get 'top'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
