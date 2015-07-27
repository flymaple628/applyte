class School < ActiveRecord::Base
	validates_presence_of :name

	has_many :programs

	has_one :address, :as=> :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address, allow_destroy: true

	has_many :photos, :as=>:photo_link, :dependent => :destroy
	accepts_nested_attributes_for :photos, allow_destroy: true

	before_destroy :check_programs

private


	def check_programs
		if self.programs.length >0
			errors[:base] << "#{self.name} can't be deleted due to have more than 0 programs"
			return false
		end
	end


end
