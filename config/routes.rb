Rails.application.routes.draw do
	root 'welcome#index'
	resources :about, only: [:index]
end
