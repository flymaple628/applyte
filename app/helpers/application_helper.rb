module ApplicationHelper

	def address_escape(address)
		# Use { q: address }.to_query
		address.gsub ' ','+' if address
	end

	def check_user_program_forms(program)
		session[:myprogram] ||= []
		session[:myprogram].include?(program.id.to_s) ||
		(current_user && program.user_program_forms.where(:user_id=>current_user).any?)
	end

	def shorten(text, w_len)
		truncate(text, :length => w_len, :separator => ' ' )
	end

	def convertFormKey(form_keys)
		form_key_result = {}
		FormKeyCategory.includes(:form_keys).each do |form_key_cat|
			form_key_result[form_key_cat.name] = []
			form_keys.each do |form_key|
				if form_key_cat.form_key_ids.includes(form_key.id)
					form_key_result[form_key_cat.name] << form_key
				end
			end
		end
	end


	def check_auto_compelete(type)
		if current_user.profile && type.form_key.auto_compelete_id

			#if ["name", "birthday", "major", "research_area"].include?(type.form_key.auto_compelete.name)
			#	return current_user.profile.send(type.form_key.auto_compelete.name).present?
			#elsif ["toefl", "gre"].include?(type.form_key.auto_compelete.name)
			#	return profile.toefl_read && profile.toefl_listen &&profile.toefl_speak &&profile.toefl_write
			#elsif ....
			#end

			case type.form_key.auto_compelete.name #
				when "name"
				  return current_user.profile.name.present?
				when "birthday"
				  if current_user.profile.birthday
				  	puts "value.user.profile.birthday"
				  	return true
				  end
				when "major"
				  if current_user.profile.major
				  	puts "value.user.profile.major"
				  	return true
				  end
				when "research_area"
				  if current_user.profile.research_area
				  	puts "value.user.profile.research_area"
				  	return true
				  end
				when "toefl"
					profile=current_user.profile
				  return !!( profile.toefl_read && profile.toefl_listen &&profile.toefl_speak &&profile.toefl_write )
				when "gre"
					profile=current_user.profile
				  if profile.gre_verbal && profile.gre_guantitatiue &&profile.gre_awa &&profile.gre_total
				  	puts "value.user.profile.gre"
				  	return true
				  end

				when "publication"

				  if current_user.profile.publications.count > 0
				  	puts "value.user.profile.publications"
				  	return true
				  end

				when "honor"
				  if current_user.profile.honors.count > 0
				  	puts "value.user.profile.honor"
				  	return true
				  end

				when "research_experience"
				  if current_user.profile.research_experiences.count > 0
				  	puts "value.user.profile.research_experience"
				  	return true
				  end

				when "work_experience"
				  if current_user.profile.work_experiences.count > 0
				  	puts "value.user.profile.work_experience"
				  	return true
				  end

				else
				  false
			end
		end
	end
end
