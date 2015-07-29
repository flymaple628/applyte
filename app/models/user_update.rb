class UserUpdate < ActiveRecord::Base
	belongs_to :user_updatable, polymorphic: true
	belongs_to :user

	def self.save_update(object,action)
		self.create(:user_updatable_type=>object.class.name,:user_updatable_id=>object.id,:action=>action)
	end

end
