class Publication < ActiveRecord::Base
	validates_presence_of :serial,:title

	belongs_to :user
end
