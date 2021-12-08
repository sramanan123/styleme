class UploadImage < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum vibe: {"casual"=>0, "evening_wear"=>1, "professional"=>2} 

  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "image_id",
             :dependent => :destroy

  has_many   :image_comments,
             :foreign_key => "image_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
