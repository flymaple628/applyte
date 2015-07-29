class FormKey < ActiveRecord::Base
	belongs_to :form_key_category
	has_many :program_form_keys
	before_destroy :check_form_keys

private
	def check_form_keys
		if self.program_form_keys.length >0
			errors[:base] << "unable to delete due to have program_form_keys"
			return false
		end
	end

end
