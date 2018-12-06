Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :sessions, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
