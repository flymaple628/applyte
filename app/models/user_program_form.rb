class UserProgramForm < ActiveRecord::Base
	belongs_to :user
	belongs_to :program
	has_many :user_program_form_values, :as=> :form_values

	def form_keys
		self.program.program_form_keys
	end

end
