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

  has_many :program_areaships, :dependent => :destroy
	has_many :areas, :through=>:program_areaships

  has_many :program_form_key_categories, :through=>:program_form_keys, :source=>:program_form_key_category

  before_create :save_default_program_key
  before_destroy :check_subclasses


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


  def save_default_program_key
		program_keys = [["first name",1,"string"],
										["middle name",1,"string"],
										["last name",1,"string"],
										["preferred name",1,"string"],
										["Are you Hispanic or Latino?",2,"boolean"],
										["United States Military or Veteran Status",3,"string"],
										["address1",4,"string"],
										["city",4,"string"],
										["phone",4,"string"],
										["program",5,"string"],
										["Educational History",6,"text"],
										["Test Information",6,"text"],
										["Application Information",6,"text"],
										["Financial Aid",6,"text"],
										["Employment History & Languages",6,"text"],
										["Supplemental Information",6,"text"],
										["Register Your References",6,"text"],
										["Document Uploads, Confirmation & Submission",6,"text"],
										["GRE",7,"integer"],
										["TOEFL",7,"integer"],
										["Statement of Purpose",8,"text"],
										["Letters of Recommendation",8,"text"],
										["Transcripts (Academic Records)",8,"text"]]

		program_keys.each_with_index do |pk,index|
			self.program_form_keys.new(
					:name=>pk[0],
					:program_form_key_category_id=>pk[1],
					:order=> index+1,
					:key_type=>pk[2]
					)
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
