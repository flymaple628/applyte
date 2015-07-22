class CreateFacultyAreas < ActiveRecord::Migration
  def change
    create_table :faculty_areas do |t|
    	t.integer :faculty_id, :index=>true
    	t.integer :area_id, :index=>true
      t.timestamps null: false
    end
  end
end
