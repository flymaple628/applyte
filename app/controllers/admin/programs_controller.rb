class Admin::ProgramsController < ApplicationController
  before_action :set_programs
  before_action :set_program, :only=>[:edit, :update,:destroy]

  def index
    @program = Program.new
    refresh
  end 

  def create
    @program = Program.new(program_params)
    if @program.save
      @notice = "program success to created"
    else
      @notice = @program.errors.full_messages
    end

    @program = Program.new
    refresh
  end

  def edit

    refresh
  end

  def update
    if @program.update(program_params)
      @notice = "program success to updated"
    else
      @notice = @program.errors.full_messages      
    end

    @program = Program.new
    refresh
  end


  def destroy
    @program.destroy
    @program = Program.new
    refresh
  end

private 
  def set_programs
    @programs = Program.includes(:address).order('id desc')
  end

  def set_program
    @program = Program.find params[:id]
  end 

	def program_params
		params.require(:program).permit(:title, :degree, :level, :desc, :department, :program_category_id,
																	 :fax, :phone, :email, :address_id, :school_id, :tuition, :ranking, :deadline,
                                   :address_attributes=>[:address1, :address2, :city_id],
                                   :photos_attributes =>[:photo, :_destroy, :id])
	end

  def refresh
    respond_to do |format|
      format.js { render 'admin/programs/refresh'}
    end
  end
end
