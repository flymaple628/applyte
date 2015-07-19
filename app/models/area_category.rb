class AreaCategory < ActiveRecord::Base
	has_many :area_to_area_categories
	has_many :areas, :through=>:area_to_area_categories, :source=>:area

end
