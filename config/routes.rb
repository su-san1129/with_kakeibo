Rails.application.routes.draw do

  root to: "top#index"
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :variable_costs, only: [:index, :show, :edit, :create, :update, :destroy] do
  	resource :cost_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  	resource :maps
  end
  resources :categories, only: [:create, :update, :destroy]
  resources :incomes, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
