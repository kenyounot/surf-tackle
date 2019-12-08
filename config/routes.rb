Rails.application.routes.draw do

  
  resources :reviews
  resources :brands
  resources :items do
    get 'highest_rated', on: :collection
    resources :reviews, only: [:new, :index]
  end

  
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}


  resources :users do
    resources :items, only:[:index]
  end

  root to: 'application#welcome'
end
