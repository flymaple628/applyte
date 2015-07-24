class Admin::ProgramAreashipsController < ApplicationController
	before_action :set_program_areaships
	before_action :set_program_areaship, :only=>[:edit, :update,:destroy]

  def index
    @program_areaship = ProgramAreaship.new
    refresh
  end

  def create
  	@program_areaship = ProgramAreaship.new(program_areaship_params)

  	if ProgramAreaship.find_by(program_areaship_params).nil? and @program_areaship.save
  		@notice = "program_areaship success to created"
  	else
  		@notice = @program_areaship.errors.full_messages
  	end

    @program_areaship = ProgramAreaship.new
    refresh
  end

  def edit

    refresh
  end

  def update
  	if @program_areaship.update(program_areaship_params)
  		@notice = "program_areaship success to updated"
  	else
  		@notice = @program_areaship.errors.full_messages
  	end

    @program_areaship = ProgramAreaship.new
    refresh
  end


  def destroy
  	@program_areaship.destroy
    @program_areaship = ProgramAreaship.new
    refresh
  end

private
  def set_program_areaships
    @program_areaships = ProgramAreaship.includes(:area,:program).order('id desc')

  end

	def set_program_areaship
		@program_areaship = ProgramAreaship.find params[:id]
	end

	def program_areaship_params
		params.require(:program_areaship).permit(:program_id,:area_id)
	end

  def refresh
    respond_to do |format|
      format.js { render 'admin/program_areaships/refresh'}
      format.html
    end
  end
end
