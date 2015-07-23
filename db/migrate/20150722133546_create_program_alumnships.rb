class CreateProgramAlumnships < ActiveRecord::Migration
  def change
    create_table :program_alumnships do |t|
   		t.integer :program_id, :index=>true
    	t.integer :user_id, :index=>true
    	t.integer :profile_id, :index=>true
    	t.integer :alumn_id, :index=>true

      t.timestamps null: false
    end
  end
end
