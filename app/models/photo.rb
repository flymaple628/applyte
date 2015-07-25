class Photo < ActiveRecord::Base
	validates_presence_of :photo_link_type,:photo_link_id

	belongs_to :photo_link, polymorphic: true
  has_attached_file :photo,
  									:styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
