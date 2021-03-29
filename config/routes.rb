Rails.application.routes.draw do
  resources :journals do
    resources :tasks do
      resources :descriptions
    end
  end
  devise_for :users
  root to: "home#index" 
end
