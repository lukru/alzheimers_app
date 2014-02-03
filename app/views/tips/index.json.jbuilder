json.array!(@tips) do |tip|
  json.extract! tip, :id, :name, :activity_type, :description, :references
  json.url tip_url(tip, format: :json)
end
