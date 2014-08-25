class ItemsController < ApplicationController

	before_filter :find_item, only: [:show, :edit, :update, :destroy]


	def index
		@items = Item.all
	end
	
	def show
		unless @item
			render text: "Page not found", status: 404
		end
	end
	
	def new
		@item = Item.new
	end
	
	def edit
	end
	
	def create
		@item = Item.create(items_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end
	
	def update
		@item.update_attributes(items_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end
	
	def destroy
		@item.destroy
		redirect_to action: "index"
	end	
	
	private

	
	def find_item
		@item = Item.where(id: params[:id]).first
		render_404 unless @item
	end
	

	def items_params
		params.require(:item).permit(:name, :price, :description, :weight)
	end
	
end
