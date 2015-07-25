class ProgramFormKeyCategory < ActiveRecord::Base
	validates_presence_of	:name

	has_many :program_form_keys
end
