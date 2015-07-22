class Profile < ActiveRecord::Base
	belongs_to :user

	has_many :experiences

	has_many :research_experiences, -> { where( :etype => "Research") }, :class_name => "Experience"
	has_many :work_experiences, -> { where( :etype => "Work") }, :class_name => "Experience"

  has_many :publications
  has_many :honors

  has_one :alumn

  accepts_nested_attributes_for :research_experiences, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :work_experiences, :allow_destroy => true, :reject_if => :all_blank
	accepts_nested_attributes_for :publications, :allow_destroy => true, :reject_if => :all_blank
	accepts_nested_attributes_for :honors, :allow_destroy => true, :reject_if => :all_blank
	accepts_nested_attributes_for :alumn, :allow_destroy => true, :reject_if => :all_blank

end
