class Admin::ProgramsController < ApplicationController
	before_action :set_program, :only=>[:update,:delete]

  def create
  	@program = Program.new(program_params)
  	if @program.save
  		@notice = "program success to created"
  	else
  		@notice = @program.errors.full_messages
  	end

		respond_to |format|
			format.js { render 'admin/program/refresh'}
  	end
  end


  def update
  	if @program.update(program_params)
  		@notice = "program success to updated"
  	else
  		@notice = @program.errors.full_messages  		
  	end

		respond_to |format|
			format.js { render 'admin/program/refresh'}
  	end
  end


  def destroy
  	@program.destroy

		respond_to |format|
			format.js { render 'admin/program/refresh'}
  	end
  end

private 
	def set_program
		@program = Program.find params[:id]
	end 

	def program_params
		params.require(:program).permit(:name, :degree, :level, :desc, :department,
																	 :fax, :phone, :email, :address_id, :school_id)
	end

end
