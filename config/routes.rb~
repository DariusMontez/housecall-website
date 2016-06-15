require 'subdomain'

Rails.application.routes.draw do
  
	get '', to: 'hcncentral#index', constraints: {subdomain: 'central'}
	
	constraints subdomain: 'central', layout: 'hcncentral' do
		resources :data_entries
		resources :patients
		resources :nodes
		resources :locations
	  resources :doctors
  	resources :appointments
  	
  	post 'patients/:id/records' => 'patients#update_hpatient'
	end
	
	constraints subdomain: '' do
		resources :sessions
  	resources :appointments
		get 'sign_out' => 'sessions#destroy', as: 'sign_out'
		get 'sign_in' => 'sessions#new', as: 'sign_in'
		get 'register' => 'doctors#new', as: 'register'
		get 'dashboard' => 'doctors#dashboard', as: 'dashboard'
		get 'welcome' => 'staticpages#index', as: 'welcome'
 		get 'profile' => 'doctors#profile'
 		
	end
	
	get 'appointments/:id/accept' => 'appointments#accept', as: 'accept_appointment'

	root 'application#root'

end
