class Admin::ProgramFormKeysController < ApplicationController
  before_action :set_programs
  before_action :set_program, :only=>[:edit ,:update]

  def index
    if params[:edit_id]
      @edit_program = Program.includes(:program_form_keys => {:form_key => :form_key_category}).find(params[:edit_id])
    else
      @edit_program = nil
    end
    refresh
  end

  def update
    params['program_form_key'].each do |form_key_id,value|
      program_form_key = @program.program_form_keys.includes(:form_key).find_by_form_key_id(form_key_id)
      form_key = FormKey.find(form_key_id)
      name = value[:name]=="" ? form_key.name : value[:name]
      if program_form_key
        if value[:check]
          program_form_key.update(:name=>value[:name],:desc=> value[:desc])
        else
          program_form_key.destroy
        end
      else
        if value[:check]
          @program.program_form_keys.create!(:name=>name , :form_key_id=>form_key.id)
        end
      end
    end

    #   @notice = {:success=>"#{@program_key.name} has been updated successfully"}
    #   current_user.user_updates.save_update(@program_key,"update")
    #   @notice = {:fail=>@program_key.errors.full_messages}

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
  	@programs = Program.includes(:program_form_keys => {:form_key => :form_key_category}).order('id desc')
  end

  def set_program
    @program = Program.includes(:program_form_keys => {:form_key => :form_key_category}).find params[:id]
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
