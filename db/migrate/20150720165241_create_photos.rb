class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string	:photo_link_type
    	t.integer :photo_link_id
      t.timestamps null: false
    end

    add_attachment :photos, :photo
  end
end
