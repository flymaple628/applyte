class UserProgramFormValue < ActiveRecord::Base
	belongs_to :user_program_form
	belongs_to :program_form_key

end

