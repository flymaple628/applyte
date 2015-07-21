class ProfilesController < ApplicationController
	before_action :get_profiles
	#GET /profolio/
	def show
		@profile.publications_build if @profile.publications.empty?
	end

	def edit

	end
	#POST /profolio/
	def create
		@profile = Profile.new(profile_params)
  	@profile.user_id=current_user.id
  	@profile.publications.build
  	@profile.save

	end
	#PATCH /profolio/
	def update
		@profile = current_user.profile.update(profile_params)
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
						:publications => [{:title=>[],:url=>[]}],
						:honor_attributes=>[:title=>[],:get_date=>[],:description=>[]],
						:experience_attributes=>[:institude=>[],:title=>[],:date_from=>[],:date_to=>[],:type=>[]]
						)
	end

end
