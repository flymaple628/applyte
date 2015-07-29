class Admin::SchoolsController < ApplicationController
  before_action :set_schools
  before_action :set_school, :only=>[:edit, :update,:destroy]

  def index
    @school = School.new
    refresh
  end 

  def create
    @school = School.new(school_params)
    if @school.save
      @notice = {:success=>"#{@school.name} has been created successfully"}
      current_user.user_updates.save_update(@school,"create")
      @school = School.new
    else
      @notice = {:fail=>@school.errors.full_messages}
    end

    refresh
  end

  def edit

    refresh
  end

  def update
    if @school.update(school_params)
      @notice = {:success=>"#{@school.name} has been updated successfully"}
      current_user.user_updates.save_update(@school,"update")
      @school = School.new
    else
      @notice = {:fail=>@school.errors.full_messages}
    end

    refresh
  end


  def destroy
    if @school.destroy
      @notice = {:success=>"#{@school.name} has been destroyed successfully"}
      current_user.user_updates.save_update(@school,"destroy")
    else
      @notice = {:fail=>@school.errors.full_messages}
    end

    @school = School.new
    refresh
  end

private 
  def set_schools
    @schools = School.all.order('id desc')
  end

  def set_school
    @school = School.find params[:id]
  end 

  def school_params
    params.require(:school).permit(:name, :campus, :desc, :phone, :email,
                                   :city_id, :link_name, :link_url,
                                   :logo_attributes => [:photo, :id],
                                   :address_attributes=>[:address1, :address2, :city_id, :postal_code, :id],
                                   :photos_attributes =>[:photo, :_destroy, :id])

  end

  def refresh
    respond_to do |format|
      format.js { render 'admin/schools/refresh'}
    end
  end

end
