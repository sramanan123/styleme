class BookmarkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image_id, :integer
  attribute :notes, :string
  attribute :user_id, :integer

  # Direct associations

  belongs_to :image,
             resource: UploadImageResource

  belongs_to :user

  # Indirect associations
end
