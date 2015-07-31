class UserProgramsController < ApplicationController
	before_action :authenticate_user!,:except=>[:index,:fevorite]

	def index
		@form_key_categories = FormKeyCategory.all
		@wish = current_user.user_program_forms.wish
		@progress = current_user.user_program_forms.progress
		@finish = current_user.user_program_forms.finish
		if current_user
			session[:myprogram]=[]
		end
	end

	def show

		@user_program_form = current_user.user_program_forms.includes(:user_program_form_values   ).find_or_create_by(:program_id=>params[:id])

		if @user_program_form.user_program_form_values.empty?
	  		@user_program_form.initialize_values
		end
	end

	def update

		@user_program_form = current_user.user_program_forms.find(params[:id])
		@user_program_form.update(user_program_form_params)

		@user_program_form = current_user.user_program_forms.find(params[:id])
		percen = @user_program_form.count_percen
		@user_program_form.update({:percen=>percen})
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
		params.require(:user_program_form).permit(:user_program_form_values_attributes=>[:id,:program_form_key_id,:check,:note, :form_key_category_id, :percen_count])
	end

end
