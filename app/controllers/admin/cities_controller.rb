class Admin::CitiesController < ApplicationController
	before_action :set_city, :only=>[:update,:delete]

  def create
  	@city = City.new(city_params)
  	if @city.save
  		@notice = "city success to created"
  	else
  		@notice = @city.errors.full_messages
  	end

		respond_to |format|
			format.js { render 'admin/city/refresh'}
  	end
  end


  def update
  	if @city.update(city_params)
  		@notice = "city success to updated"
  	else
  		@notice = @city.errors.full_messages  		
  	end

		respond_to |format|
			format.js { render 'admin/city/refresh'}
  	end
  end


  def destroy
  	@city.destroy

		respond_to |format|
			format.js { render 'admin/city/refresh'}
  	end
  end

private 
	def set_city
		@city = City.find params[:id]
	end 

	def city_params
		params.require(:city).permit(:name,:state_id)
	end
end
