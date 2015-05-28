Rails.application.routes.draw do
	mount Blorgh::Engine, at: "/blog" 

  devise_for :users
	resources :items
	root :to => "items#index"

	resources :items
	
end
