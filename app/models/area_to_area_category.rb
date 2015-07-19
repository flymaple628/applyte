class AreaToAreaCategory < ActiveRecord::Base
	belongs_to :area_category
	belongs_to :area
end
