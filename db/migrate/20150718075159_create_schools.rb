class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :campus
      t.string :desc
      t.string :phone
      t.string :email
      t.integer :logo_id, :index=>true
      t.integer :address_id, :index=>true
      t.string :link_name
      t.string :link_url

      t.timestamps null: false
    end
  end
end
