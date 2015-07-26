class Photo < ActiveRecord::Base


	belongs_to :photo_link, polymorphic: true
  has_attached_file :photo,
  									:styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
