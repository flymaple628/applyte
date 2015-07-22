class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :get_profiles
	#GET /profolio/
	def show
		@profile.publications
		@profile.honors
		@profile.research_experiences
		@profile.work_experiences
	end

	def edit
		@profile.publications.new if @profile.publications.empty?
		@profile.honors.new if @profile.honors.empty?
		@profile.research_experiences.new if @profile.research_experiences.empty?
		@profile.work_experiences.new if @profile.work_experiences.empty?
	end
	#POST /profolio/
	def create
		@profile = Profile.new(profile_params)
  	@profile.user_id=current_user.id
  	@profile.save

  	redirect_to :back
	end
	#PATCH /profolio/
	def update
		byebug
		@profile = current_user.profile.update(profile_params)
		redirect_to :back
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
						:work_experiences_attributes=>[:id,:institude,:title,:date_from,:date_to,:type,:etype,:_destroy]
						)
	end

end
