class ProgramsController < ApplicationController
	before_action :show_search_bar

	def index
		set_keyword
		set_sort_by

		@programs = Program.where(["title like ?","%#{@keyword}%"]).order(@sort_by)
		@programs = @programs.includes(:address, :school, :user_program_forms)
	end

	def show
		@program = Program.includes(:photos).find(params[:id])
		@pic_list = @program.get_photo_list
		@address = @program.school.address.address1

		@alumns=@program.alumns

		@faculties = Faculty.all # FIXME
	end

private

	def set_keyword
		if params[:keyword].present?
			session[:keyword] = params[:keyword]
		else
			session[:keyword] ||= "Computer Science"
		end
		@keyword = session[:keyword]
	end

	def set_sort_by
		if params[:sort_by] 
			session[:sort_by] = params[:sort_by]
		else
			session[:sort_by] ||= "ranking"
		end
		@sort_by = session[:sort_by]
	end


	def show_search_bar
		@search_show = true
	end

end
