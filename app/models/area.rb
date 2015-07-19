class Area < ActiveRecord::Base
	belongs_to :program
	has_many :area_to_area_categories
	has_many :area_categories, :through=>:area_to_area_categories, :source=>:area_category
end
