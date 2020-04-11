Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'about' => 'home#about', as: 'about'

  resources :posts do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index] do
    member do
     get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
