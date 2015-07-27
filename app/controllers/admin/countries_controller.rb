class Admin::CountriesController < ApplicationController
  before_action :set_countries
  before_action :set_country, :only=>[:edit, :update,:destroy]

  def index
    @country = Country.new
    refresh
  end 

  def create
    @country = Country.new(country_params)
    if @country.save
      @notice = {:success=>"#{@country.name} success to created"}
      current_user.user_updates.save_update(@country,"create")
      @country = Country.new
    else
      @notice = {:fail=>@country.errors.full_messages}
    end

    refresh
  end

  def edit

    refresh
  end

  def update
    if @country.update(country_params)
      @notice = {:success=>"#{@country.name} is successful updated"}
      current_user.user_updates.save_update(@country,"update")
      @country = Country.new
    else
      @notice = {:fail=>@country.errors.full_messages}
    end

    refresh
  end


  def destroy
    if @country.destroy
      @notice = {:success=>"#{@country.name} is successful destroyed"}
      current_user.user_updates.save_update(@country,"destroy")
    else
      @notice = {:fail=>@country.errors.full_messages}
    end
    
    @country = Country.new
    refresh
  end

private 
  def set_countries
    @countries = Country.all.order('id desc')
  end

  def set_country
    @country = Country.find params[:id]
  end 

  def country_params
    params.require(:country).permit(:name)
  end

  def refresh
    respond_to do |format|
      format.js { render 'admin/countries/refresh'}
    end
  end
end
