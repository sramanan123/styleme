json.extract! user, :id, :first_name, :last_name, :username, :created_at,
              :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt
