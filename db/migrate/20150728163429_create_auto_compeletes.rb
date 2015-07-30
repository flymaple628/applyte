class CreateAutoCompeletes < ActiveRecord::Migration
  def change
    create_table :auto_compeletes do |t|
    	t.string :name
 			t.string :associated
      t.timestamps null: false
    end
    add_column :form_keys, :auto_compelete_id, :integer
  end
end
