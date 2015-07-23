class ProgramFormKey < ActiveRecord::Base
	belongs_to :program
	belongs_to :program_form_key_category
	has_many :user_program_form_values

	def user_value(user)
		self.user_program_form_values.find_or_initialize_by(:user_id=>user.id)
	end

end
