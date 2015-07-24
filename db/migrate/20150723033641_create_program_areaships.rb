class CreateProgramAreaships < ActiveRecord::Migration
  def change
    create_table :program_areaships do |t|
    	t.integer :area_id, :index=>true
    	t.integer :program_id, :index=>true
      t.timestamps null: false
    end
  end
end
