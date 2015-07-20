class School < ActiveRecord::Base
	has_many :programs
	belongs_to :address
	
end
