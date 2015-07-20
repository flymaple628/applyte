class Admin::CountriesController < ApplicationController
	before_action :set_country, :only=>[:update,:delete]

  def create
  	@country = Country.new(country_params)
  	if @country.save
  		@notice = "country success to created"
  	else
  		@notice = @country.errors.full_messages
  	end

		respond_to |format|
			format.js { render 'admin/country/refresh'}
  	end
  end


  def update
  	if @country.update(country_params)
  		@notice = "country success to updated"
  	else
  		@notice = @country.errors.full_messages  		
  	end

		respond_to |format|
			format.js { render 'admin/country/refresh'}
  	end
  end


  def destroy
  	@country.destroy

		respond_to |format|
			format.js { render 'admin/country/refresh'}
  	end
  end

private 
	def set_country
		@country = Country.find params[:id]
	end 

	def country_params
		params.require(:country).permit(:name)
	end
end
