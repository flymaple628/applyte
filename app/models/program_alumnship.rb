class ProgramAlumnship < ActiveRecord::Base
	belongs_to :user
	belongs_to :program
	belongs_to :profile, foreign_key: "profile_id"
	belongs_to :alumn, foreign_key: "alumn_id"
end
