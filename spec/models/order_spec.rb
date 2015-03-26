require 'rails_helper'

describe Order do
	it "calculates the total price of the order" do
		
		item1 = create(:item)
		item2 = create(:item)

		order = create(:order)
		order.items << item1
		order.items << item2

		order.calculate_total
		expect(order.total).to eq(20)
	end
end	
