Rails.application.routes.draw do
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sites#index'

  namespace :admin do
    resources :sites, expect:[:destroy]
    resources :admins
  end

  resources :admins, only:[:index, :show]

  resources :sites, only:[:index, :show]
end