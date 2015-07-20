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
  		@notice = "city success to created"
  	else
  		@notice = @city.errors.full_messages
  	end

    @city = City.new
    refresh
  end

  def edit

    refresh
  end

  def update
  	if @city.update(city_params)
  		@notice = "city success to updated"
  	else
  		@notice = @city.errors.full_messages  		
  	end

    @city = City.new
    refresh
  end


  def destroy
  	@city.destroy
    @city = City.new
    refresh
  end

private 
  def set_cities
    @cities = City.all
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
