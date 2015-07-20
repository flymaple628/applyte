class Program < ActiveRecord::Base
	after_initialize :check_address

	has_many :user_program_forms
	has_many :program_form_keys
	belongs_to :school
	has_many :areas

	has_one :address, :as=> :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address, allow_destroy: true

	has_many :photos, :as=>:photo_link, :dependent => :destroy
	accepts_nested_attributes_for :photos, allow_destroy: true

private

	def check_address
		self.build_address unless self.address
	end


end
