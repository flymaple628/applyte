class CreateProgramCategories < ActiveRecord::Migration
  def change
    create_table :program_categories do |t|
      t.string :name

      t.timestamps null: false
    end

    add_column :programs, :program_category_id, :integer
    add_index :programs, :program_category_id 
    remove_column :programs, :name
    add_column :programs, :title, :string
    add_column :programs, :ranking, :integer
    add_column :programs, :tuition, :integer
    add_column :programs, :deadline, :date

    remove_column :alumns, :program_id
  end
end
