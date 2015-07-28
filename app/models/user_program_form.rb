class UserProgramForm < ActiveRecord::Base
	belongs_to :user
	belongs_to :program
	has_many :user_program_form_values
	accepts_nested_attributes_for :user_program_form_values, :allow_destroy => true, :reject_if => :all_blank

	def initialize_values
		self.program.program_form_keys.each do |k|
			# byebug
			if(k.form_key.profile_column)
				# puts "key:"+self.user.profile.("#{k.form_key.form_key_category.profile_column}")
				byebug
				if	self.user.profile.try("#{k.form_key.profile_column}")
					check = true
				end
				byebug
			else

			check=false

			end
			self.user_program_form_values.new(:program_form_key => k,:check=> check )
		end
		self.user_program_form_values
	end

end
