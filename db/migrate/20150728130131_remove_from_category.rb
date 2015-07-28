class RemoveFromCategory < ActiveRecord::Migration
  def change
  	remove_column :form_key_categories, :profile_column, :string
  	add_column :form_keys, :profile_column, :string
  end
end
