class CreateProgramFormKeyCategories < ActiveRecord::Migration
  def change
    create_table :program_form_key_categories do |t|
    	t.string :name
      t.timestamps null: false
    end

    add_column :program_form_keys, :program_form_key_category_id, :integer
    add_index :program_form_keys, :program_form_key_category_id
    remove_column :program_form_keys, :category

  end
end
