Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cars do
    collection do
      get "vin", to: "cars#vin"
      post "vin", to: "cars#create_from_vin"
    end

    resources :appointments, only: [:create]
    resources :messages, only: [:create]
  end
  resources :users, only: [:show] do
    resources :appointments, only: [:destroy]
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path_prefix: 'd'
  mount Attachinary::Engine => "/attachinary"

  # get '/cars/new/2' => 'cars#new2', :as => :new_cars_2
  # post '/cars/new' => 'cars#create_via_vin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
