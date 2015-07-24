class ProgramAlumnship < ActiveRecord::Base

	belongs_to :program
	belongs_to :alumn

end
