Rails.application.routes.draw do
  resources :reviews
  resources :brands
  resources :items do
    resources :reviews, only: [:new, :index]
  end
  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users do
    resources :items, only:[:index]
  end

  root to: 'application#welcome'
end
