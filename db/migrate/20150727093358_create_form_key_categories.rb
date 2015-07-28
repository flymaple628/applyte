class CreateFormKeyCategories < ActiveRecord::Migration
  def change
    create_table :form_key_categories do |t|
    	t.string :name
    	t.string :note
      t.timestamps null: false
    end
  end
end
