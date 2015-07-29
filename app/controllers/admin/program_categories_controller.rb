class Admin::ProgramCategoriesController < ApplicationController
	before_action :set_program_categories
	before_action :set_program_category, :only=>[:edit, :update,:destroy]

	def index
		@program_category = ProgramCategory.new
		refresh
	end

  def create
  	@program_category = ProgramCategory.new(program_category_params)
  	if @program_category.save
      @notice = {:success=>"#{@program_category.name} has been created successfully"}
      current_user.user_updates.save_update(@program_category,"create")
      @program_category = ProgramCategory.new
  	else
      @notice = {:fail=>@program_category.errors.full_messages}
  	end

    refresh
  end

  def edit

    refresh
  end

  def update
  	if @program_category.update(program_category_params)
      @notice = {:success=>"#{@program_category.name} has been updated successfully"}
      current_user.user_updates.save_update(@program_category,"update")
      @program_category = ProgramCategory.new
  	else
      @notice = {:fail=>@program_category.errors.full_messages}
  	end

    refresh
  end


  def destroy
  	if @program_category.destroy
      @notice = {:success=>"#{@program_category.name} has been destroyed successfully"}
      current_user.user_updates.save_update(@program_category,"destroy")
    else
      @notice = {:fail=>@program_category.errors.full_messages}      
    end      
    @program_category = ProgramCategory.new
    refresh
  end


private

	def set_program_categories
		@program_categories = ProgramCategory.all
	end

	def set_program_category
		@program_category = ProgramCategory.find params[:id]
	end

	def program_category_params
		params.require(:program_category).permit(:name)
	end	

	def refresh
		respond_to do |format|
			format.js {render "admin/program_categories/refresh"}
		end
	end

end
