Rails.application.routes.draw do
  resources :reviews
  resources :brands
  resources :items
  devise_for :users, :controllers => {registrations: 'registrations'}

  root to: 'application#welcome'
end
