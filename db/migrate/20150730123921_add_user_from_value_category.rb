class AddUserFromValueCategory < ActiveRecord::Migration
  def change
  	add_column :user_program_form_values, :form_key_category_id, :integer
  	add_index :user_program_form_values, :form_key_category_id
  end
end
