Rails.application.routes.draw do

  root to: 'pages#home'
  resources :cars do
    resources :appointments, only: [:create]
    resources :messages, only: [:create]
  end
  resources :users, only: [:show] do
    resources :appointments, only: [:destroy]
  end
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path_prefix: 'd'
  mount Attachinary::Engine => "/attachinary"

  GET '/cars/new/2' => 'cars#new2', :as => :new_cars_2
  POST '/cars/new' => 'cars#create_via_vin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
