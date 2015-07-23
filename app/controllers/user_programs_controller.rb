class UserProgramsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_programs, :only=>[:index]
	#GET /user_programs/
	def index

	end

	#GET /user_programs/:program_id
	def show

	end


	protected

	def user_programs_params
	end

	def get_program
		@program=User.first.user_program_forms.find(params[:id])
	end

	def get_programs
		@programs=User.first.programs
	end
end
