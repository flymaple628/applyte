class Experience < ActiveRecord::Base
		validates_presence_of :serial

		belongs_to :user
end
