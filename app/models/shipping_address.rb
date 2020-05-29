class ShippingAddress < ApplicationRecord
	belongs_to :customer

	def registered_address
		self.postcode + " " +  self.address + " " +  self.name
	end
end
