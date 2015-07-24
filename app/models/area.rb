class Area < ActiveRecord::Base
	# belongs_to :program
	has_many :area_to_area_categories
	has_many :area_categories, :through=>:area_to_area_categories, :source=>:area_category

	has_many :program_areaships
	has_many :programs, :through=>:program_areaships
end
