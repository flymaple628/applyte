class Admin::AreasController < ApplicationController
	before_action :set_areas
	before_action :set_area, :only=>[:edit, :update,:destroy]

  def index
    @area = Area.new
    refresh
  end

  def create
  	@area = Area.new(Area_params)
  	if @area.save
  		@notice = "area success to created"
  	else
  		@notice = @area.errors.full_messages
  	end

    @area = Area.new
    refresh
  end

  def edit

    refresh
  end

  def update
  	if @area.update(area_params)
  		@notice = "area success to updated"
  	else
  		@notice = @area.errors.full_messages
  	end

    @area = Area.new
    refresh
  end


  def destroy
  	@area.destroy
    @area = Area.new
    refresh
  end

private
  def set_areas
    @areas = Area.all.order('id desc')
  end

	def set_area
		@area = Area.find params[:id]
	end

	def area_params
		params.require(:area).permit(:name)
	end

  def refresh
    respond_to do |format|
      format.js { render 'admin/areas/refresh'}
    end
  end
end
