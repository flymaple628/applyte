class Address < ActiveRecord::Base
	validates_presence_of :address1,:postal_code,:addressable_type

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
