class CreateProgramFormKeys < ActiveRecord::Migration
  def change
    create_table :program_form_keys do |t|
    	t.string :name
    	t.string :desc
    	t.integer :order
    	t.integer :program_id, :index=>true
    	t.string :key_type
    	t.string :list_value
      t.timestamps null: false
    end
  end
end
