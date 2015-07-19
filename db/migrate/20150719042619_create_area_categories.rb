class CreateAreaCategories < ActiveRecord::Migration
  def change
    create_table :area_categories do |t|
    	t.string :name
    	t.text :desc

      t.timestamps null: false
    end
  end
end
