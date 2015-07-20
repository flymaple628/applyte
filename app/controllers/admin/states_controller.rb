class Admin::StatesController < ApplicationController
	before_action :set_state, :only=>[:update,:delete]

  def create
  	@state = State.new(state_params)
  	if @state.save
  		@notice = "state success to created"
  	else
  		@notice = @state.errors.full_messages
  	end

		respond_to |format|
			format.js { render 'admin/state/refresh'}
  	end
  end


  def update
  	if @state.update(state_params)
  		@notice = "state success to updated"
  	else
  		@notice = @state.errors.full_messages  		
  	end

		respond_to |format|
			format.js { render 'admin/state/refresh'}
  	end
  end


  def destroy
  	@state.destroy

		respond_to |format|
			format.js { render 'admin/state/refresh'}
  	end
  end

private 
	def set_state
		@state = State.find params[:id]
	end 

	def state_params
		params.require(:state).permit(:name,:country_id)
	end
end
