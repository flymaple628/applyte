class AddCatInFormKey < ActiveRecord::Migration
  def change
  	add_column :program_form_keys, :category, :string
  end
end
