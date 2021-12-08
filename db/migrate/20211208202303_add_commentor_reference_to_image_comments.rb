class AddCommentorReferenceToImageComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :image_comments, :users, column: :commentor_id
    add_index :image_comments, :commentor_id
    change_column_null :image_comments, :commentor_id, false
  end
end
