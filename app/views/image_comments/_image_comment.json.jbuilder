json.extract! image_comment, :id, :image_id, :comment, :commentor_id, :created_at, :updated_at
json.url image_comment_url(image_comment, format: :json)
