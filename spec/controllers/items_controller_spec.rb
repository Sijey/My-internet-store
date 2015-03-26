require 'rails_helper'

describe ItemsController do

	describe "show action" do
		
		it "render show template if an item is found" do
			item = create(:item)
			get :show, {	id: item.id }
			response.should render_template('show')
		end
		it "render 404 page if an item is not foud" do
			get :show, { id: 0 }
			response.status.should == 404
		end
	end

	describe "create action" do
		it "redirect to item_path if validations pass" do
			post :create, item: { name: "Item 1", description: "description", price: '10' }
			response.should redirect_to(item_path(assigns(:item)))
		end

		it "render new page again if validations fail" do
			post :create, item: { name: "Item 1", description: "description", price: 0 }
			response.should render_template('new')
		end

	end

end
