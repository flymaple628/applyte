class AddApplicantOnProgram < ActiveRecord::Migration
  def change
  	add_column :programs, :applicant, :integer
  end
end
