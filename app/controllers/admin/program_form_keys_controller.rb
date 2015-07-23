class Admin::ProgramFormKeysController < ApplicationController
  before_action :set_programs
  before_action :set_program, :only=>[:create, :edit ,:update ,:destroy]

  def index

    refresh
  end 

  def create
    @program_key = @program.program_form_keys.new(program_form_key_params)
    if @program_key.save
      @notice = "program success to created"
    else
      @notice = @program_key.errors.full_messages
    end

    refresh
  end

  def edit
    @edit_program_key = @program.program_form_keys.find params[:id]
    refresh
  end

  def update
    @program_key = @program.program_form_keys.find params[:id]
    if @program_key.update(program_form_key_params)
      @notice = "program success to updated"
    else
      @notice = @program.errors.full_messages      
    end

    refresh
  end


  def destroy
    @program_key = @program.program_form_keys.find params[:id]
    @program_key.destroy
    refresh
  end

private 
  def set_programs
  	@programs = Program.all.order('id desc')
  end

  def set_program
    @program = Program.find params[:program_id]
  end

	def program_form_key_params
		params.require(:program_form_key).permit(:name,:desc,:order,:key_type,:desc)

	end

  def refresh
    respond_to do |format|
      format.js { render 'admin/program_form_keys/refresh'}
    end
  end

end
