class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.string :degree
      t.string :level
      t.string :desc
      t.string :department
      t.integer :area_id, :index=>true
      t.string :fax
      t.string :phone
      t.string :email
      t.integer :address_id, :index=>true
      t.integer :school_id, :index=>true

      t.timestamps null: false
    end
  end
end
