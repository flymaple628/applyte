class ProgramCategory < ActiveRecord::Base
	has_many :programs
	before_destroy :check_programs

private
	def check_programs
		if self.programs.length >0
			errors[:base] << "can't delete due to have programs"
			return false
		end
	end

end
