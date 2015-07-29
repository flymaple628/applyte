class Admin::FormKeysController < ApplicationController
	before_action :set_form_keys
	before_action :set_form_key, :only=>[:edit, :update,:destroy]

	def index
		@form_key = FormKey.new

		refresh
	end

  def create
  	@form_key = FormKey.new(form_key_params)
  	if @form_key.save
      @notice = {:success=>"#{@form_key.name} has been created successfully"}
      current_user.user_updates.save_update(@form_key,"create")
      @form_key = FormKey.new
  	else
      @notice = {:fail=>@form_key.errors.full_messages}
  	end

    refresh
  end

  def edit

    refresh
  end

  def update
  	if @form_key.update(form_key_params)
      @notice = {:success=>"#{@form_key.name} has been updated successfully"}
      current_user.user_updates.save_update(@form_key,"update")
      @form_key = FormKey.new
  	else
      @notice = {:fail=>@form_key.errors.full_messages}
  	end

    refresh
  end


  def destroy
  	if @form_key.destroy
      @notice = {:success=>"#{@form_key.name} has been destroyed successfully"}
      current_user.user_updates.save_update(@form_key,"destroy")
    else
      @notice = {:fail=>@form_key.errors.full_messages}
    end
    @form_key = FormKey.new
    refresh
  end


private

	def set_form_keys
		@form_keys = FormKey.all.order(:form_key_category_id)
    @profile = Profile.column_names
	end

	def set_form_key
		@form_key = FormKey.find params[:id]
	end

	def form_key_params
		params.require(:form_key).permit(:name, :note, :key_type, :form_key_category_id,:auto_compelete_id)
	end

	def refresh
		respond_to do |format|
			format.js {render "admin/form_keys/refresh"}
		end
	end
end
