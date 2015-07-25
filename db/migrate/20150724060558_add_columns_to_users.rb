class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_provider, :string
    add_column :users, :auth_uid, :string
    add_column :users, :auth_token, :string
    add_column :users, :auth_raw_data, :text
  end

  add_attachment :users, :avatar
end
