class CreateUploadImages < ActiveRecord::Migration[6.0]
  def change
    create_table :upload_images do |t|
      t.string :image
      t.string :topstyle
      t.string :topcolor
      t.string :bottomstyle
      t.string :bottomcolor
      t.string :shoestyle
      t.string :shoecolor
      t.integer :vibe

      t.timestamps
    end
  end
end
