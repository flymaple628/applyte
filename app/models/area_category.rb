class AreaCategory < ActiveRecord::Base
	validates_presence_of :name

	has_many :area_to_area_categories
	has_many :areas, :through=>:area_to_area_categories, :source=>:area

end
