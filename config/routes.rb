# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  post 'home/search'
  devise_for :users

  resources :vehicles do
    resources :rides do
      resources :requests
    end
  end
  resources :all_requests
  resources :account
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
