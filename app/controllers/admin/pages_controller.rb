class Admin::PagesController < ApplicationController
	before_action :authenticate_user!
	layout 'admin'

  def index
  	@programs = Program.all
  	@program = Program.new

  end


protected

end
