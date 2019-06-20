Rails.application.routes.draw do
  
  root to: "top#index"
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :variable_costs, only: [:index, :show, :edit, :create, :update, :destroy] do
  	resources :cost_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :categories, only: [:create, :update, :destroy]
  resources :incomes, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
