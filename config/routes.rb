Rails.application.routes.draw do
  root to: "stores#top"
  resources :stores, only: :index do
    collection do
      get 'top'
    end
  end
end
