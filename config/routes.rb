Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
	resources :posts do
		resources :comments
		collection do
			get 'search'
		end

		member do
			put "like", to: "posts#upvote"
		end
	end
		
	root "posts#index"

	get '/about', to: 'pages#about'
end
