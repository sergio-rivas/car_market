Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cars do
    resources :appointments, only: [:create]
  end
  resources :users, only: [:show] do
    resources :appointments, only: [:destroy]
  end
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path_prefix: 'd'
  mount Attachinary::Engine => "/attachinary"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
