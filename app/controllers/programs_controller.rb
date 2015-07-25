class ProgramsController < ApplicationController
	before_action :show_search_bar

	def index
		if params[:keyword]
			@programs = Program.where(["name like ?","%#{params[:keyword]}%"])
		else
			@programs = Program.all
		end

		@programs = @programs.includes(:address,:user_program_forms)
	end

	def show
		@program = Program.includes(:photos).find(params[:id])
		@pic_list = @program.photo_list
		@address = @program.school.address.address1


		@alumns=@program.alumns

		@faculties = Faculty.all # FIXME
	end

private



	def show_search_bar
		@search_show = true
	end

end
