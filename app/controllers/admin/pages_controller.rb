class Admin::PagesController < ApplicationController
	before_action :authenticate_user!
	layout 'admin'

  def index
  	@models = [Country, State, City, School, Photo, Address,
  						 Program, ProgramFormKey, ProgramFormKeyCategory,
  						 ProgramCategory, Faculty, FacultyArea, ProgramAreaship,
  						 Area, AreaCategory, AreaToAreaCategory, 
  						 User, Profile, Experience, Honor, Publication, Alumn, ProgramAlumnship,
  						 UserProgramForm, UserProgramFormValue
  						 ]

  end



protected

end
