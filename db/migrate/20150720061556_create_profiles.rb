class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id, :index=>true
    	t.string :name
    	t.date :birthday
    	t.string :major
    	t.string :research_area
    	t.integer :toefl_read
    	t.integer :toefl_listen
    	t.integer :toefl_speak
    	t.integer :toefl_write
    	t.integer :toefl_total
    	t.integer :gre_verbal
    	t.integer :gre_guantitatiue
    	t.integer :gre_awa
    	t.integer :gre_total


      t.timestamps null: false
    end
  end
end
