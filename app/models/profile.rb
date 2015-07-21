class Profile < ActiveRecord::Base
	belongs_to :user

	has_many :experiences
	has_many :research_experiences
  has_many :publications
  has_many :honors

  accepts_nested_attributes_for :experiences, :allow_destroy => true, :reject_if => :all_blank
	accepts_nested_attributes_for :publications, :allow_destroy => true, :reject_if => :all_blank
	accepts_nested_attributes_for :honors, :allow_destroy => true, :reject_if => :all_blank

end
