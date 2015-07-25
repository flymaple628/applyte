class Faculty < ActiveRecord::Base
	validates_presence_of :name,:email


  has_attached_file :image,
  									:styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :program


end
