class FormKeyCategory < ActiveRecord::Base
	has_many :form_keys
	has_many :user_program_form_values
	before_destroy :check_form_keys

private
	def check_form_keys
		if self.form_keys.length >0
			errors[:base] << "unable to delete due to have form_keys"
			return false
		end
	end

end
