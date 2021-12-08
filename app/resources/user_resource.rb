class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :username, :string

  # Direct associations

  has_many   :bookmarks

  has_many   :image_comments,
             foreign_key: :commentor_id

  # Indirect associations
end
