Rails.application.routes.draw do
  resources :journals
  devise_for :users
  root to: "home#index" 
end
