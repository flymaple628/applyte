class RemoveProgramAlumnsUserId < ActiveRecord::Migration
  def change
  	remove_column :program_alumnships,:user_id
  	remove_column :program_alumnships,:profile_id
  end
end
