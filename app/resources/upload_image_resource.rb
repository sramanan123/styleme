class UploadImageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image, :string
  attribute :topstyle, :string
  attribute :topcolor, :string
  attribute :bottomstyle, :string
  attribute :bottomcolor, :string
  attribute :shoestyle, :string
  attribute :shoecolor, :string
  attribute :vibe, :string_enum, allow: UploadImage.vibes.keys

  # Direct associations

  has_many   :bookmarks,
             foreign_key: :image_id

  has_many   :image_comments,
             foreign_key: :image_id

  # Indirect associations

end
