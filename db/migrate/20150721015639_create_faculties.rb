class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
    	t.integer :program_id, :index=>:true
    	t.string :name
    	t.string :intro
      t.timestamps null: false
    end
  end
end
