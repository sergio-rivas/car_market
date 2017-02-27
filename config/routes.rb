Rails.application.routes.draw do
  resources :cars do
	  resources :bookings
	end
  resources :resources do
		end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
