class ModifyKeyNameInUserProgramFormValues < ActiveRecord::Migration
  def change
  	remove_column :user_program_form_values, :user_program_form_key_id
  	add_column :user_program_form_values, :program_form_key_id, :integer
  	add_index :user_program_form_values, :program_form_key_id
  end
end
