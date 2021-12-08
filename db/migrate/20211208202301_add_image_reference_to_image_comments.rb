class AddImageReferenceToImageComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :image_comments, :upload_images, column: :image_id
    add_index :image_comments, :image_id
    change_column_null :image_comments, :image_id, false
  end
end
