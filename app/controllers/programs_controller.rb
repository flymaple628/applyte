class ProgramsController < ApplicationController

	def index
		if params[:keyword]
			@programs = Program.where(["name like ?","%#{params[:keyword]}%"])
		else
			@programs = Program.all
		end

	end

	def show
		@program = Program.find(params[:id])
		@address = @program.school.address.address1

	end


end
