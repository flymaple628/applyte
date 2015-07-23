class ProgramsController < ApplicationController
	before_action :show_search_bar

	def index
		if params[:keyword]
			@programs = Program.where(["name like ?","%#{params[:keyword]}%"])
		else
			@programs = Program.all
		end

	end

	def show
		@program = Program.find(params[:id])
		@pic_list = @program.photo_list
		@address = @program.school.address.address1

		@users=@program.users
		if @user
			@profiles=@users.profile
		else
			@profiles={}
		end
	end

private

	def show_search_bar
		@search_show = true
	end

end
