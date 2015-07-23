class UserProgramsController < ApplicationController
	before_action :authenticate_user!	

	def index
		@user_program_forms = current_user.user_program_forms
	end

	def show
		@user_program_form = current_user.user_program_forms.find params[:id]
		if @user_program_form.user_program_form_values.empty?
			@user_program_form_values = @user_program_form.initialize_values
		else
			@user_program_form_values = @user_program_form.user_program_form_values.includes(:program_form_key)
		end
	end

	def update
		@user_program_form = current_user.user_program_forms.find params[:id]
		@user_program_form.update(user_program_form_params)
		redirect_to progress_path(@user_program_form)
	end



private
	
	def user_program_form_params
		params.require(:user_program_form).permit(:user_program_form_values_attributes=>[:id,:program_form_key_id,:check,:note])
	end

end
