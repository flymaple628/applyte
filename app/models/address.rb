class Address < ActiveRecord::Base
	before_create :check_state_country

	has_many :schools
	has_many :programs
	belongs_to :city
	belongs_to :state
	belongs_to :country
	belongs_to :addressable, :polymorphic => true 

	def check_state_country
		self.state = self.city.state
		self.country = self.state.country
	end


end
