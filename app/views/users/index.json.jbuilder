json.array!(@users) do |user|
  json.extract! user, :id, :name, :location, :type
  json.url user_url(user, format: :json)
end
