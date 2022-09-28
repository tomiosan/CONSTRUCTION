Rails.application.routes.draw do
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sites#index'

  namespace :admin do
    resources :sites
  end

  resources :admins, only:[:show, :edit, :update]
  post 'admins/:id' => 'admins#edit'

  resources :sites

end