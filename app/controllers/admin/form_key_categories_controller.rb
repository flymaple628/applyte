class Admin::FormKeyCategoriesController < ApplicationController
	before_action :set_form_key_categories
	before_action :set_form_key_category, :only=>[:edit, :update,:destroy]

	def index
    @form_key_category = FormKeyCategory.new
    refresh
	end

  def create
  	@form_key_category = FormKeyCategory.new(form_key_category_params)
  	if @form_key_category.save
      @notice = {:success=>"#{@form_key_category.name} has been created successfully"}
      current_user.user_updates.save_update(@form_key_category,"create")
      @form_key_category = FormKeyCategory.new
  	else
      @notice = {:fail=>@form_key_category.errors.full_messages}
  	end

    refresh
  end

  def edit

    refresh
  end

  def update
  	if @form_key_category.update(form_key_category_params)
      @notice = {:success=>"#{@form_key_category.name} has been updated successfully"}
      current_user.user_updates.save_update(@form_key_category,"update")
      @form_key_category = FormKeyCategory.new
  	else
      @notice = {:fail=>@form_key_category.errors.full_messages}
  	end

    refresh
  end


  def destroy
  	if @form_key_category.destroy
      @notice = {:success=>"#{@form_key_category.name} has been destroyed successfully"}
      current_user.user_updates.save_update(@form_key_category,"destroy")
    else
      @notice = {:fail=>@form_key_category.errors.full_messages}
    end
    @form_key_category = FormKeyCategory.new
    refresh
  end


private

	def set_form_key_categories
		@form_key_categories = FormKeyCategory.all
	end

	def set_form_key_category
		@form_key_category = FormKeyCategory.find params[:id]
	end

	def form_key_category_params
		params.require(:form_key_category).permit(:name, :note, :profile_column)
	end

	def refresh
		respond_to do |format|
			format.js {render "admin/form_key_categories/refresh"}
		end
	end
end
