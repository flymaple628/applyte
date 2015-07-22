class CreateAlumns < ActiveRecord::Migration
  def change
    create_table :alumns do |t|
    	t.integer :program_id, :index=>true
    	t.integer :profile_id, :index=>true
    	t.string :program_degree
    	t.string :program_year
    	t.string :admission
    	t.string :background
    	t.string :recommendation
    	t.text :description

      t.timestamps null: false
    end
  end
end
