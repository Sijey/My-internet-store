class ItemsController < ApplicationController

	def index
		@items = Item.all
	end
	
	def show
		unless @item = Item.where(id: params[:id]).first
			render text: "Page not found", status: 404
		end
	end
	
	def new
		@item = Item.new
	end
	
	def edit
	end
	
	def create
		@item = Item.create(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end
	
	def update
	end
	
	def destroy
	end	
	
end
