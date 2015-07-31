class UserProgramForm < ActiveRecord::Base
	belongs_to :user
	belongs_to :program
	has_many :user_program_form_values
	accepts_nested_attributes_for :user_program_form_values, :allow_destroy => true, :reject_if => :all_blank

	scope :wish, -> { where( percen: 0 ) }
	scope :progress, -> { where( percen: (1..99) ) }
	scope :finish, -> { where( percen: 100 ) }

	def initialize_values

		self.program.program_form_keys.each do |k|

			self.user_program_form_values.new(:program_form_key => k )

		end
		self.user_program_form_values
	end

	def count_percen
		form_key_count = self.user_program_form_values.count
		value_count = self.user_program_form_values.where(:check=>true).count
		if form_key_count> 0
			(value_count*100)/form_key_count
		else
			return 0
		end
	end

	def count_sub_percen(category)
		select=self.user_program_form_values.where(:form_key_category=>category, :check=>true ).count
		all=self.user_program_form_values.where(:form_key_category=>category).count
		if all> 0
			(select*100)/all
		else
			return 0
		end
	end

	def self.get_user_program_forms(user,session_myprogram,type)
		if user.nil?
			if session_myprogram
				user_program_forms = Program.find(myprogram)
			else
				user_program_forms=[]
			end
		else
			if session_myprogram
				session_myprogram.each do |my|
					unless user.user_program_forms.find_by_program_id(my)
						user.user_program_forms.create( :program_id => my )
					end
				end
				user_program_forms = user.user_program_forms
			end
			if type == "progress"
				user_program_forms = user.user_program_forms
			elsif type == "compelete"
				user_program_forms = user.user_program_forms
			else
				user_program_forms = user.user_program_forms
			end

		end
	end
	# pf.user_program_form_values.where(:form_key_category=>category).count
	# def check_auto_compelete(type)
	# 	if self.user.profile && type.form_key.auto_compelete_id
	# 		case type.name #
	# 			when "name"
	# 			  if self.user.profile.name
	# 			  	puts "value.user.profile.name"
	# 			  	return true
	# 			  end
	# 			when "birthday"
	# 			  if self.user.profile.birthday
	# 			  	puts "value.user.profile.birthday"
	# 			  	return true
	# 			  end
	# 			when "major"
	# 			  if self.user.profile.major
	# 			  	puts "value.user.profile.major"
	# 			  	return true
	# 			  end
	# 			when "research_area"
	# 			  if self.user.profile.research_area
	# 			  	puts "value.user.profile.research_area"
	# 			  	return true
	# 			  end
	# 			when "toefl"
	# 				profile=self.user.profile
	# 			  if profile.toefl_read && profile.toefl_listen &&profile.toefl_speak &&profile.toefl_write
	# 			  	puts "value.user.profile.toefl"
	# 			  	return true
	# 			  end

	# 			when "gre"
	# 				profile=self.user.profile
	# 			  if profile.gre_verbal && profile.gre_guantitatiue &&profile.gre_awa &&profile.gre_total
	# 			  	puts "value.user.profile.gre"
	# 			  	return true
	# 			  end

	# 			when "publications"
	# 			  if self.user.profile.publications.count > 0
	# 			  	puts "value.user.profile.birthday"
	# 			  	return true
	# 			  end

	# 			when "honor"
	# 			  if self.user.profile.honors.count > 0
	# 			  	puts "value.user.profile.honor"
	# 			  	return true
	# 			  end

	# 			when "research_experience"
	# 			  if self.user.profile.research_experience.count > 0
	# 			  	puts "value.user.profile.research_experience"
	# 			  	return true
	# 			  end

	# 			when "work_experience"
	# 			  if self.user.profile.work_experience.count > 0
	# 			  	puts "value.user.profile.work_experience"
	# 			  	return true
	# 			  end

	# 			else
	# 			  false
	# 		end
	# 	end
	# end


end
