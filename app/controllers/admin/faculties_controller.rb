class Admin::FacultiesController < ApplicationController
  before_action :set_faculties
  before_action :set_faculty, :only=>[:edit, :update,:destroy]

  def index
    @faculty = Faculty.new
    refresh
  end 

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      @notice = {:success=>"#{@faculty.name} is successfuly created"}
      current_user.user_updates.save_update(@faculty,"create")
      @faculty = Faculty.new
    else
      @notice = {:fail=>@faculty.errors.full_messages}
    end

    refresh
  end

  def edit

    refresh
  end

  def update

  	@faculty.image = nil if params[:destroy_image] == "1"

    if @faculty.update(faculty_params)
      @notice = {:success=>"#{@faculty.name} is successfuly updated"}
      current_user.user_updates.save_update(@faculty,"update")
      @faculty = Faculty.new
    else
      @notice = {:fail=>@faculty.errors.full_messages}
    end

    refresh
  end


  def destroy
    if @faculty.destroy
      @notice = {:success=>"#{@faculty.name} is successfuly destroyed"}
      current_user.user_updates.save_update(@faculty,"destroy")
      @faculty = Faculty.new
    else
      @notice = {:fail=>@faculty.errors.full_messages}
    end

    refresh
  end

private 
  def set_faculties
    @faculties = Faculty.all.order('id desc')
  end

  def set_faculty
    @faculty = Faculty.find params[:id]
  end 

  def faculty_params
    params.require(:faculty).permit(:name,:email,:intro,:link_url,:image,
                                    :title, :education, :publication, :funding,
                                    :program_id, :destroy_image)
  end

  def refresh
    respond_to do |format|
      format.js { render 'admin/faculties/refresh'}
    end
  end

end
