Rails.application.routes.draw do
	root 'blogs#index'
	 resources :blogs
	# resources :blog, only: [:index]
   # root 'home#index'
  # devise_for :users
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  resources :home
devise_scope :user do
	get 'sign-in', to: 'users/sessions#new'
end
  resources :users
end