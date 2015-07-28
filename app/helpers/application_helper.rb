module ApplicationHelper

	def address_escape(address)
		address.gsub ' ','+' if address
	end

	def check_user_program_forms(program)
		session[:myprogram] ||= []
		session[:myprogram].include?(program.id.to_s) ||
		(current_user && program.user_program_forms.any?)
	end

	def shorten(text, w_len)
		if text.length > w_len
			p = w_len
			loop do
				p+=1
				break if text[p] = " "
				break if p>= w_len
			end
			text = text[0, p] + "..."			
		end
		text
	end


end
