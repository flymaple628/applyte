class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
    	t.integer :profile_id,:index=>true
    	t.integer :serial
    	t.string :institude
    	t.string :title
    	t.date :date_from
    	t.date :date_to
      t.string :type

      t.timestamps null: false
    end
  end
end
