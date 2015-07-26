class Address < ActiveRecord::Base

	belongs_to :city
	belongs_to :state
	belongs_to :country
	belongs_to :addressable, :polymorphic => true

	before_create :check_state_country

	def check_state_country
		self.state = self.city.state
		self.country = self.state.country
	end


end
