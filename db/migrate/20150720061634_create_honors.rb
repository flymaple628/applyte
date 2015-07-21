class CreateHonors < ActiveRecord::Migration
  def change
    create_table :honors do |t|
    	t.integer :profile_id,:index=>true
    	t.integer :serial
    	t.string :title
    	t.date :get_date
    	t.text :description

      t.timestamps null: false
    end
  end
end
