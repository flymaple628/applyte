class City < ActiveRecord::Base
	validates_presence_of :name

	belongs_to :state
	has_many :addresses
	has_many :schools, :through=>:addresses, :source=>:addressable, :source_type=>"School"
	has_many :programs, :through=>:addresses, :source=>:addressable, :source_type=>"Program"

	before_destroy :check_addresses

private
	def check_addresses
		if self.addresses.length >0
			errors[:base] << "#{self.name} is unable to be deleted due to have adresses"
			return false
		end
	end

end
