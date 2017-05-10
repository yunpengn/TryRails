Rails.application.routes.draw do
  get 'welcome/index'

  # Create a resource called articles, resource is a collection of similar objects (like the concept of class)
  # The name of resources should all be nouns in plural forms.
  resources :articles  do
  	# Let comments become a nested resources of articles.
  	resources :comments
  end

  # Set the root homepage to be the index action of the welcome controller
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
