class Admin::ProgramFormKeysController < ApplicationController
  before_action :set_programs
  before_action :set_program, :only=>[:create, :edit ,:update ,:destroy]
  before_action :set_program_key, :only=>[:edit,:update,:destroy]

  def index
    if params[:edit_id]
      @edit_program = Program.find(params[:edit_id])
    else
      @edit_program = nil
    end
    refresh
  end 

  def create
    @program_key = @program.program_form_keys.new(program_form_key_params)
    # if @program_key.save
    #   @notice = {:success=>"#{@program_key.name} has been created successfully"}
    #   current_user.user_updates.save_update(@program_key,"create")
    # else
    #   @notice = {:fail=>@program_key.errors.full_messages}
    # end

    refresh
  end

  def edit
    @edit_program_key = @program_key
    refresh
  end

  def update
    if @program_key.update(program_form_key_params)
      @notice = {:success=>"#{@program_key.name} has been updated successfully"}
      current_user.user_updates.save_update(@program_key,"update")
    else
      @notice = {:fail=>@program_key.errors.full_messages}
    end

    refresh
  end


  def destroy
    if @program_key.destroy
      @notice = {:success=>"#{@program_key.name} has been deleted successfully"}      
      current_user.user_updates.save_update(@program_key,"destroy")
    else
      @notice = {:fail=>@program_key.errors.full_messages}
    end

    refresh
  end

private 
  def set_programs
  	@programs = Program.all.order('id desc')
  end

  def set_program
    @program = Program.find params[:program_id]
  end

  def set_program_key
    @program_key = @program.program_form_keys.find params[:id]
  end

	def program_form_key_params
		params.require(:program_form_key).permit(:program_form_key_category_id,:name,:desc,:order,:key_type,:desc)

	end

  def refresh
    respond_to do |format|
      format.js { render 'admin/program_form_keys/refresh'}
    end
  end

end
