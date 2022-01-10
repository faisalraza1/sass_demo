# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  namespace :seller do
    resources :products
  end
  root to: 'dashboards#index'

  devise_for :sellers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products
  resources :sellers
  resources :dashboards
  
resources :cards do
  collection do 
    post :remove_item
    post :order
  end
end

  namespace :admin do
    resources :products
  end
end
