Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cars do
    resources :appointments, only: [:create]
  end
  resources :appointments, only: [:destroy]
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
