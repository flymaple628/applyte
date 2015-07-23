class UserProgramForm < ActiveRecord::Base
	belongs_to :user
	belongs_to :program
	has_many :user_program_form_values
	accepts_nested_attributes_for :user_program_form_values, :allow_destroy => true, :reject_if => :all_blank

	def initialize_values
		self.program.program_form_keys.each do |k|
			self.user_program_form_values.new(:program_form_key => k )
		end
		self.user_program_form_values
	end

end
