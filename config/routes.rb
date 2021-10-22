Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :user
  
  resources :device_packs
  resources :experience_packs
  resources :companies
  resources :meetings

end
