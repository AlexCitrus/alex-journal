Rails.application.routes.draw do
  resources :journals do
    resources :tasks
  end
  devise_for :users
  root to: "home#index" 
end
