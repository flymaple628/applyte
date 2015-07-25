class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :get_profiles
	#GET /profolio/
	def show

	end

	def edit

	end

	def alumnus

	end

	def edit_alumnus

	end

	#POST /profolio/
	def create
		@profile = Profile.new(profile_params)
  	@profile.user = current_user
  	@profile.save

  	redirect_to :back
	end
	#PATCH /profolio/
	def update
		@profile = current_user.profile.update(profile_params)

		if params[:profile][:alumn_attributes].nil?
			redirect_to profile_path
		else
			redirect_to alumnus_profile_path
		end
	end
	#DELETE /profolio/
	def delete
		@profile = current_user.profile
    @attendee.destroy

    redirect_to :back
	end

	protected

	def get_profiles
		if current_user.profile
			@profile=current_user.profile
		else
			@profile=Profile.new
			@profile.alumn=Alumn.new
		end

	end

	def profile_params
		params.require(:profile).permit(
						:name,
						:birthday,
						:major,
						:research_area,
						:toefl_read,
						:toefl_listen,
						:toefl_speak,
						:toefl_write,
						:toefl_total,
						:gre_verbal,
						:gre_guantitatiue,
						:gre_awa,
						:gre_total,
						:publications_attributes => [:id,:title,:url,:_destroy],
						:honors_attributes=>[:id,:title,:get_date,:description,:_destroy],
						:research_experiences_attributes=>[:id,:institude,:title,:date_from,:date_to,:type,:etype,:_destroy],
						:work_experiences_attributes=>[:id,:institude,:title,:date_from,:date_to,:type,:etype,:_destroy],
						:alumn_attributes=>[:id,:program_id,:profile_id,:program_degree,:program_year,:admission,:background,:recommendation,:description,:_destro]
						)
	end

end
