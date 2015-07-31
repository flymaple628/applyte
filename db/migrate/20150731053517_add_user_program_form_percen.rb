class AddUserProgramFormPercen < ActiveRecord::Migration
  def change
  	add_column :user_program_forms, :percen, :integer, :default => 0
  	add_index :user_program_forms, :percen
  end
end
