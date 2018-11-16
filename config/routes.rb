Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: 'top#index'
  resources :groups, only: [:show, :edit, :update]
  resources :questions, only: [:create]
  resources :answers, only: [:new, :create]
end
