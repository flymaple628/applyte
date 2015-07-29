class AddColOnFaculties < ActiveRecord::Migration
  def change
  	add_column :faculties, :title, :string
  	add_column :faculties, :education, :text
  	add_column :faculties, :publication, :text
  	add_column :faculties, :funding, :text
  end

end
