class CreateImageComments < ActiveRecord::Migration[6.0]
  def change
    create_table :image_comments do |t|
      t.integer :image_id
      t.text :comment
      t.integer :commentor_id

      t.timestamps
    end
  end
end
