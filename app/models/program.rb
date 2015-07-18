class Program < ActiveRecord::Base
	has_many :user_program_forms
	has_many :program_form_keys
	belongs_to :school
end
