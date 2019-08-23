# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users

  resources :users, only: %i[index show edit update destroy] do
    resource :relationships, only: %i[create destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :variable_costs, only: %i[index show edit create update destroy] do
    resources :cost_comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  resources :categories, only: %i[create update destroy]
  resources :incomes, only: %i[create update destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
