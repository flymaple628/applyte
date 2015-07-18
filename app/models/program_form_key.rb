class ProgramFormKey < ActiveRecord::Base
	belongs_to :programs
	has_many :user_program_form_values

	def value(program)
		user_program_form_values.find_by(:user_program_form_id=>user_program_form.id)
	end

end
