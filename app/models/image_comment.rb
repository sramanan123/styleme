class ImageComment < ApplicationRecord
  # Direct associations

  belongs_to :image,
             :class_name => "UploadImage"

  belongs_to :commentor,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    image.to_s
  end

end
