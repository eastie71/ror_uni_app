Rails.application.routes.draw do
	root 'courses#index'
	post 'courses', to: 'courses#create', as: 'courses'
	get 'courses/new', to: 'courses#new', as: 'new_course'
	get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
	patch 'courses/:id', to: 'courses#update'
	get 'courses/:id', to: 'courses#show', as: 'course'
	resources :students, except: [:destroy]
end
