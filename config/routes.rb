Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "link#index" #顯示所有links
	
	resources :links do
		resources :comments, only:[:index, :new, :create]
	end

	#resources :comments, only:[:new, :create] do

	#end


	#resources :articles do
  #	resources :comments, only: [:index, :new, :create]
	#end
	#resources :comments, only: [:show, :edit, :update, :destroy]
end
