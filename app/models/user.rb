class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_program_forms
  has_many :programs, :through=>:user_program_forms

  has_many :program_alumnships
  has_many :program_alumns, :through=>:program_alumnships, :source=>:programs

  has_one :profile

end
