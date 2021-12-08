json.extract! upload_image, :id, :image, :topstyle, :topcolor, :bottomstyle, :bottomcolor, :shoestyle, :shoecolor, :vibe, :created_at, :updated_at
json.url upload_image_url(upload_image, format: :json)
