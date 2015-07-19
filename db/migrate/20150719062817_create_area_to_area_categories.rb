class CreateAreaToAreaCategories < ActiveRecord::Migration
  def change
    create_table :area_to_area_categories do |t|
    	t.integer :area_id, :index=>true
    	t.integer :area_category_id, :index=>true
      t.timestamps null: false
    end
  end
end
