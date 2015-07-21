class Faculty < ActiveRecord::Base
  before_save :check_image
	attr_accessor :_destroy_image
  has_attached_file :image, 
  									:styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :program

private

	def check_image
		if self._destroy_image == 1
			self.image = nil
		end
	end

end
