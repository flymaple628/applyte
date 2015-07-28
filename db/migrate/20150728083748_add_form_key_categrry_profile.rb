class AddFormKeyCategrryProfile < ActiveRecord::Migration
  def change
  	add_column :form_key_categories, :profile_column, :string
  end
end
