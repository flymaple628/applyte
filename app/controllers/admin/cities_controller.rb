class Admin::CitiesController < ApplicationController
  before_action :set_cities
	before_action :set_city, :only=>[:edit, :update,:destroy]

  def index
    @city = City.new
    refresh
  end 

  def create
  	@city = City.new(city_params)
  	if @city.save
  		@notice = {:success=>"#{@city.name} has been created successfully"}
  	else
  		@notice = {:fail=>@city.errors.full_messages}
  	end

    @city = City.new
    refresh
  end

  def edit

    refresh
  end

  def update
  	if @city.update(city_params)
      @notice = {:success=>"#{@city.name} has been updated successfully"}
  	else
      @notice = {:fail=>@city.errors.full_messages}
  	end

    @city = City.new
    refresh
  end

  def destroy
    name = @city.name
    if @city.destroy
      @notice = {:success=>"#{@city.name} has been destroyed successfully"}
    else
      @notice = {:fail=>@city.errors.full_messages}
    end

    @city = City.new
    refresh
  end

private 
  def set_cities
    @cities = City.all.order('id desc')
  end

	def set_city
		@city = City.find params[:id]
	end 

	def city_params
		params.require(:city).permit(:name,:state_id)
	end

  def refresh
    respond_to do |format|
      format.js { render 'admin/cities/refresh'}
    end
  end
end
