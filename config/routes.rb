Rails.application.routes.draw do
	root 'welcome#index'
	resources :about, only: [:index]

	get 'sign_up', to: 'registrations#new'
	post 'sign_up', to: 'registrations#create'
end
