class UploadImage < ApplicationRecord
  enum vibe: {"casual"=>0, "evening_wear"=>1, "professional"=>2} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
