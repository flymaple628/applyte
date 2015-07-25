module ApplicationHelper

	def address_escape(address)
		address.gsub ' ','+' if address
	end

	def check_user_program_forms(program)
		session[:myprogram] ||= []
		if session[:myprogram].include?(program.id.to_s)|| (current_user&&program.user_program_forms.exists?)
			true
		else
			false
		end
	end

end
