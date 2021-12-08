class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :image_id
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
