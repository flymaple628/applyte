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
      @notice = "state success to created"
    else
      @notice = @state.errors.full_messages
    end

    @state = State.new
    refresh
  end

  def edit

    refresh
  end

  def update
    if @state.update(state_params)
      @notice = "state success to updated"
    else
      @notice = @state.errors.full_messages      
    end

    @state = State.new
    refresh
  end


  def destroy
    @state.destroy
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
