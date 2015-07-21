module ApplicationHelper

	def address_escape(address)
		address.gsub ' ','+' if address
	end


end
