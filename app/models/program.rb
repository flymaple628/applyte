class Program < ActiveRecord::Base
	validates_presence_of :title,:degree,:department

	has_many :user_program_forms
	has_many :users, :through=>:user_program_forms

	belongs_to :school
	belongs_to :program_category
	# has_many :areas
	has_many :faculties

	has_many :program_alumnships
	has_many :alumns, :through=>:program_alumnships


	has_one :address, :as=> :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address, allow_destroy: true

	has_many :photos, :as=>:photo_link, :dependent => :destroy
	accepts_nested_attributes_for :photos, allow_destroy: true

	has_many :program_form_keys, :dependent => :destroy
  accepts_nested_attributes_for :program_form_keys, :allow_destroy => true, :reject_if => :all_blank
  has_many :form_keys, :through=>:program_form_keys

  has_many :program_areaships, :dependent => :destroy
	has_many :areas, :through=>:program_areaships

  before_destroy :check_subclasses
  before_create :check_program_form_keys

  def get_photo_list
  	photo_list
  end

private

	def check_subclasses
		destroy = true
		if self.users.count >0
			errors[:base] << "user_program_forms more than 0 "
			destroy = false
		end

		if self.faculties.count >0
			errors[:base] << "faculties more than 0 "
			destroy = false
		end

		if self.alumns.count >0
			errors[:base] << "alumnus more than 0 "
			destroy = false
		end

		destroy
	end

	def check_program_form_keys
		if self.program_form_keys.count ==0
			FormKey.all.each do |fk|
				self.program_form_keys.new(:form_key_id=>fk.id, :name=>fk.name)
			end
		end
	end

	def photo_list #temp method
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
