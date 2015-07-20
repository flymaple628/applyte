module ApplicationHelper

	def address_escape(address)
		address.gsub ' ','+'
	end


end
