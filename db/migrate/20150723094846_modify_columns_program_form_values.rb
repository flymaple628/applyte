class ModifyColumnsProgramFormValues < ActiveRecord::Migration
  def change
  	remove_column :user_program_form_values, :content
  	add_column :user_program_form_values, :note, :text
  	add_column :user_program_form_values, :check, :boolean
  end
end
