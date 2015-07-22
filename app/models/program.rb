class Program < ActiveRecord::Base
	after_initialize :check_address

	has_many :user_program_forms
	has_many :program_form_keys
	belongs_to :school
	has_many :areas
	has_many :faculties

	has_one :address, :as=> :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address, allow_destroy: true

	has_many :photos, :as=>:photo_link, :dependent => :destroy
	accepts_nested_attributes_for :photos, allow_destroy: true


	def check_address
		self.build_address unless self.address
	end

	def photo_list
		list = []
		public_pics = Dir.glob("public/example_pic/school/*")
		10.times do |index|
			if photos.count > index
				list.push(photos[index].photo.url)
			else
				pic = public_pics[rand(public_pics.count)].gsub('public','')
				list.push(pic)
			end
		end
		list
	end

end
