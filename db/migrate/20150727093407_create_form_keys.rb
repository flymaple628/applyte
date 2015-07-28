class CreateFormKeys < ActiveRecord::Migration
  def change
    create_table :form_keys do |t|
    	t.string :name
    	t.string :note
    	t.integer :form_key_category_id
      t.timestamps null: false
    end

    add_index :form_keys, :form_key_category_id
    add_column :program_form_keys, :form_key_id, :integer
    add_index :program_form_keys, :form_key_id
    remove_column :program_form_keys, :program_form_key_category_id
  end
end
