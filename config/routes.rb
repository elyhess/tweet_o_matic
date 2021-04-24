Rails.application.routes.draw do
	mount ActionCable.server => '/cable'


	root 'welcome#index'
	resources :about, only: [:index]

	get 'password', to: "passwords#edit", as: :edit_password
	patch 'password', to: "passwords#update"

	get 'sign_up', to: 'registrations#new'
	post 'sign_up', to: 'registrations#create'

	get 'sign_in', to: 'sessions#new'
	post 'sign_in', to: 'sessions#create'

	delete 'logout', to: 'sessions#destroy'

	# sends out email
	get 'password/reset', to: 'password_resets#new'
	post 'password/reset', to: 'password_resets#create'

	# performs reset itself
	get 'password/reset/edit', to: 'password_resets#edit'
	patch 'password/reset/edit', to: 'password_resets#update'

	get 'auth/twitter/callback', to: "omniauth_callbacks#twitter"

	get '/progress_bar', to: "automated_tweets#progress_bar"
	resources :twitter_accounts
	resources :tweets

	resources :automated_tweets
end
