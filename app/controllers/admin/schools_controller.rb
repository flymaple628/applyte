class Admin::SchoolsController < ApplicationController
	before_action :set_school, :only=>[:update,:delete]

  def create
  	@school = School.new(school_params)
  	if @school.save
  		@notice = "school success to created"
  	else
  		@notice = @school.errors.full_messages
  	end

		respond_to |format|
			format.js { render 'admin/school/refresh'}
  	end
  end


  def update
  	if @school.update(school_params)
  		@notice = "school success to updated"
  	else
  		@notice = @school.errors.full_messages  		
  	end

		respond_to |format|
			format.js { render 'admin/school/refresh'}
  	end
  end


  def destroy
  	@school.destroy

		respond_to |format|
			format.js { render 'admin/school/refresh'}
  	end
  end

private 
	def set_school
		@school = School.find params[:id]
	end 

	def school_params
		params.require(:school).permit(:name, :campus, :desc, :phone, :email,
																	 :logo_id, :address_id, :link_name, :link_url)
	end

end
