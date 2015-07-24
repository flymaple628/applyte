class UserProgramsController < ApplicationController
	before_action :authenticate_user!,:except=>[:index,:fevorite]
	before_action :set_session,:only=>[:index,:fevorite]
	def index
		if current_user.nil?
			@user_program_forms=Program.find(session[:myprogram])
		else
			if session[:myprogram]
				session[:myprogram].each do |my|
					if current_user.user_program_forms.find_by_program_id(my).nil?
						current_user.user_program_forms.create({:program_id=>my})
					end
				end
				session[:myprogram]=[]
				@user_program_forms = current_user.user_program_forms
			end
		end
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

	def fevorite
		if current_user && current_user.user_program_forms.find_by_program_id(params[:id]).nil?
			current_user.user_program_forms.create({:program_id=>params[:id]})
		else
			session[:myprogram] << params[:id]
		end
		respond_to do |format|
		  format.html	{ redirect_to myprograms_path}
		  format.js
		end
	end


private

	def set_session
		session[:myprogram] ||= []
	end
	def user_program_form_params
		params.require(:user_program_form).permit(:user_program_form_values_attributes=>[:id,:program_form_key_id,:check,:note])
	end

end
