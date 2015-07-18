class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.string :address1
    	t.string :address2
    	t.integer :city_id, :index=>true
    	t.integer :state_id, :index=>true
    	t.integer :country_id, :index=>true
    	t.string :postal_code

      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps null: false
    end
  end
end
