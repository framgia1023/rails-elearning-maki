Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#index'
  resources :users do
    resources :words, only: [:index]
    member do 
    get :following, :followers 
    end
  end

  resources :sessions, only: :create
  resources :relationships, only: [:create, :destroy]
  resources :categories, only: [:index] 
  resources :lessons, only: [:show, :create] do
    resources :answers, only: [:new, :create]
  end

  namespace :admin do
    resources :users, only: [:index] do
      member do
        get :set_admin
        get :remove_admin
      end
    end
    resources :categories do
      resources :words
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
