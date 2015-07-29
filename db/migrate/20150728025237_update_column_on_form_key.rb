class UpdateColumnOnFormKey < ActiveRecord::Migration
  def change
    add_column :form_keys, :key_type, :string
    remove_column :program_form_keys, :key_type

  end
end
