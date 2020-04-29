Rails.application.routes.draw do
  root 'home#index'
  # devise_for :users
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  
devise_scope :user do
	get 'sign-in', to: 'users/sessions#new'
end
end