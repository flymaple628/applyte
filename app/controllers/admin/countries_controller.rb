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
      @notice = "country success to created"
    else
      @notice = @country.errors.full_messages
    end

    @country = Country.new
    refresh
  end

  def edit

    refresh
  end

  def update
    if @country.update(country_params)
      @notice = "country success to updated"
    else
      @notice = @country.errors.full_messages      
    end

    @country = Country.new
    refresh
  end


  def destroy
    @country.destroy
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
