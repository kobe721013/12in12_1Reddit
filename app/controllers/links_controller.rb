class LinksController < ApplicationController
	before_action :authenticate_user!

	def index
		puts "links#index start"
		#@links = Link.all
		#debugger
		@links = Link.page(params[:page]).per(5)
		
	end

	def new
		puts "links#new start"
		#@link = Link.new
		@link = current_user.links.build
	end

	def create
		#@link = Link.new(link_params)
		@link = current_user.links.build(link_params)

		if(@link.save)
			redirect_to links_path, notice:"success !!!"
		else
			render :new#重填,如果用redirect_to的話, field過多,要重填，使用者不開心
		end

	end

	def show
		@link = Link.find(params[:id])
	end	

	private
		def link_params
			#permit_params = params.require(:link).permit(:title, :url)
			#p "permit_params:#{params.methods.sort}, is_a?Hash:#{params.class}"
  		params.require(:link).permit(:title, :url)
	 	end
end
