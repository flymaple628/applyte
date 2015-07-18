class CreateUserProgramFormValues < ActiveRecord::Migration
  def change
    create_table :user_program_form_values do |t|
    	t.integer :user_program_form_id, :index=>true
    	t.integer :user_program_form_key_id, :index=>true
    	t.string :content

      t.timestamps null: false
    end
  end
end
