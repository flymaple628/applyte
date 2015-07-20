class School < ActiveRecord::Base
	after_initialize :check_address
	
	has_many :programs

	has_one :address, :as=> :addressable	
	accepts_nested_attributes_for :address, allow_destroy: true

	has_many :photos, :as=>:photo_link, :dependent => :destroy
	accepts_nested_attributes_for :photos, allow_destroy: true

private

	def check_address
		self.build_address unless self.address
	end

	
end
