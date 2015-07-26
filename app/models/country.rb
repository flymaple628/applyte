class Country < ActiveRecord::Base
	validates_presence_of :name
	validates_uniqueness_of :name

	has_many :states
	before_destroy :check_states

private
	def check_states
		if self.states.length >0
			errors[:base] << "unable to delete due to have states"
			return false
		end
	end


end
