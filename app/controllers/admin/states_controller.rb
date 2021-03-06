class Admin::StatesController < ApplicationController
  before_action :set_states
  before_action :set_state, :only=>[:edit, :update,:destroy]

  def index
    @state = State.new
    refresh
  end 

  def create
    @state = State.new(state_params)
    if @state.save
      @notice = {:success=>"#{@state.name} has been created successfuly"}
      current_user.user_updates.save_update(@state,"create")
      @state = State.new
    else
      @notice = {:fail=>@state.errors.full_messages}
    end

    refresh
  end

  def edit

    refresh
  end

  def update
    if @state.update(state_params)
      @notice = {:success=>"#{@state.name} has been updated successfuly"}
      current_user.user_updates.save_update(@state,"update")
      @state = State.new
    else
      @notice = {:fail=>@state.errors.full_messages}
    end

    refresh
  end


  def destroy
    if @state.destroy
      @notice = {:success=>"#{@state.name} has been destroyed successfuly"}
      current_user.user_updates.save_update(@state,"destroy")
    else
      @notice = {:fail=>@state.errors.full_messages}
    end

    @state = State.new
    refresh
  end

private 
  def set_states
    @states = State.all.order('id desc')
  end

  def set_state
    @state = State.find params[:id]
  end 

  def state_params
    params.require(:state).permit(:name,:country_id)
  end

  def refresh
    respond_to do |format|
      format.js { render 'admin/states/refresh'}
    end
  end

end
