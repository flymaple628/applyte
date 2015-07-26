class State < ActiveRecord::Base
	validates_presence_of :name
	validates_uniqueness_of :name

	has_many :cities
	belongs_to :country
	before_destroy :check_cities

private
	def check_cities
		if self.cities.length >0
			errors[:base] << "unable to delete due to have cities"
			return false
		end
	end

end
