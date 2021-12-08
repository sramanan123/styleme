class ImageCommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image_id, :integer
  attribute :comment, :string
  attribute :commentor_id, :integer

  # Direct associations

  # Indirect associations

end
