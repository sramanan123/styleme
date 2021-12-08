class AddImageReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :upload_images, column: :image_id
    add_index :bookmarks, :image_id
    change_column_null :bookmarks, :image_id, false
  end
end
