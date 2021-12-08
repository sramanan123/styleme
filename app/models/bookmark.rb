class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :image,
             class_name: "UploadImage"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    image.to_s
  end
end
