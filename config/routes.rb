Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	root "projects#index"

	get "/projects", to: "projects#index"

	resources "contacts", only: [:new, :create]

	match '/contacts', to: 'contacts#new', via: 'get'
  

end
