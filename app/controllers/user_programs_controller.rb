class UserProgramsController < ApplicationController
	before_action :authenticate_user!,:except=>[:index,:fevorite]

	def index
		@form_key_categories = FormKeyCategory.all

		if current_user.nil?
			@user_program_forms = Program.find(session[:myprogram])
		else
			if session[:myprogram]
				session[:myprogram].each do |my|
					unless current_user.user_program_forms.find_by_program_id(my)
						current_user.user_program_forms.create( :program_id => my )
					end
				end
				session[:myprogram] = []
				@user_program_forms = current_user.user_program_forms
			end
		end

		if 	@user_program_forms.nil?
			@user_program_forms=[]
		end
	end

	def show

		@user_program_form = current_user.user_program_forms.includes(:user_program_form_values   ).find_by_program_id(params[:id])

		if @user_program_form.user_program_form_values.empty?
	  		@user_program_form.initialize_values
		end
	end

	def update
		@user_program_form = current_user.user_program_forms.find(params[:id])
		@user_program_form.update(user_program_form_params)

		redirect_to myprograms_path
	end

	def fevorite
		get_user_program_forms

		@program=  Program.find(params[:id])
		respond_to do |format|
		  format.html	{ redirect_to myprograms_path }
		  format.js
		end
	end

private

	def get_user_program_forms
		@add=false
		if current_user
			if current_user.user_program_forms.find_by_program_id(params[:id]).nil?
				current_user.user_program_forms.create( :program_id => params[:id] )
				@add=true
			else
				user_program_forms=current_user.user_program_forms.find_by_program_id(params[:id])
				user_program_forms.destroy()
			end
		else
			if session[:myprogram].include?(params[:id])
				session[:myprogram].delete(params[:id])
			else
				session[:myprogram] << params[:id]
				@add=true
			end
		end

	end

	def user_program_form_params
		params.require(:user_program_form).permit(:user_program_form_values_attributes=>[:id,:program_form_key_id,:check,:note])
	end

end
