class ProgramCategory < ActiveRecord::Base
	has_many :programs
	before_destroy :check_programs

private
	def check_programs
		if self.programs.length >0
			errors[:base] << "#{self.name} can't be deleted due to have more than 0 programs"
			return false
		end
	end

end
