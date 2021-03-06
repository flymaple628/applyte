class ProgramFormKey < ActiveRecord::Base
	validates_presence_of :name
	#list_value could be without validating (Derek)

	belongs_to :program
	belongs_to :form_key
	has_many :user_program_form_values

	def user_value(user)
		self.user_program_form_values.find_or_initialize_by(:user_id=>user.id)
	end

end
