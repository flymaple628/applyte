class CreateUserUpdates < ActiveRecord::Migration
  def change
    create_table :user_updates do |t|
    	t.string	:user_updatable_type
    	t.integer :user_updatable_id
    	t.integer :user_id
    	t.string :action

      t.timestamps null: false
    end

    add_index :user_updates, :user_id
    add_index :user_updates, :user_updatable_id

  end
end
