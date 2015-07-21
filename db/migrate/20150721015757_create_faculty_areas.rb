class CreateFacultyAreas < ActiveRecord::Migration
  def change
    create_table :faculty_areas do |t|

      t.timestamps null: false
    end
  end
end
