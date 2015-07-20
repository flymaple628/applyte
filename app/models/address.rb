class Address < ActiveRecord::Base
	has_many :schools
	has_many :programs
		
end
