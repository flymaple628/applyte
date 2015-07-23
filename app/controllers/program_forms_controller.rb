class ProgramFormsController < ApplicationController
	before_action :set_program_and_categories

	def index
		@program_keys = @program.program_form_keys
		@pic_list = @program.photo_list

	end



private

	def set_program_and_categories
		@program = Program.find params[:program_id]
		@program_form_key_categories = @program.program_form_key_categories.group(:program_form_key_category_id)
	end

end
