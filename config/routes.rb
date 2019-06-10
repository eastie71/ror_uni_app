Rails.application.routes.draw do
	root 'courses#index'
	get 'courses/new', to: 'courses#new'
	resources :students, except: [:destroy]
end
