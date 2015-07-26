class Area < ActiveRecord::Base
	validates_presence_of :name

	has_many :area_to_area_categories
	has_many :area_categories, :through=>:area_to_area_categories, :source=>:area_category

	has_many :program_areaships
	has_many :programs, :through=>:program_areaships
end
