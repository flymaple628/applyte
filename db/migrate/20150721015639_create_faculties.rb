class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
    	t.integer :program_id, :index=>:true
    	t.string :name
      t.string :email
    	t.string :intro
    	t.string :link_url
      t.timestamps null: false
    end

  	add_attachment :faculties, :image
  end
end
