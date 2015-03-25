class Item < ActiveRecord::Base
	
	
	validates :price, numericality: { greater_than: 0, allow_nil: true }
	validates :name, :price, :description, presence: true

	has_many :positions
	has_many :carts, through: :positions
	has_and_belongs_to_many :orders

	has_many :comment, as: :commentable


end
