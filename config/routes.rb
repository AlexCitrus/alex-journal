# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :journals do
    resources :tasks do
      resources :descriptions
    end
  end
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root to: 'home#index'
end
