class ImageCommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image_id, :integer
  attribute :comment, :string
  attribute :commentor_id, :integer

  # Direct associations

  belongs_to :image,
             resource: UploadImageResource

  belongs_to :commentor,
             resource: UserResource

  # Indirect associations

end
