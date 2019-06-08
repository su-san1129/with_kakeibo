Rails.application.routes.draw do

  get '/' => "top#index"
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
