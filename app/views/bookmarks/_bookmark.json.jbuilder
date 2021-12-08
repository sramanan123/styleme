json.extract! bookmark, :id, :image_id, :notes, :user_id, :created_at,
              :updated_at
json.url bookmark_url(bookmark, format: :json)
