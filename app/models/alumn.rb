class Alumn < ActiveRecord::Base
	belongs_to :profile

	has_many :program_alumnships
  has_many :program_alumns, :through=>:program_alumnships, :source=>:programs

end
