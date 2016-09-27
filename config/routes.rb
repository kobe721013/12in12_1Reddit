Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "links#index" #顯示所有links
	get 'about', to: 'webinfo#about', as: 'wow_about'
	get 'contact', to: 'webinfo#contact', as: 'wow_contact'

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
