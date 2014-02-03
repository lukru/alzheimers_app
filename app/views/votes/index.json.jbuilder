json.array!(@votes) do |vote|
  json.extract! vote, :id, :references, :references
  json.url vote_url(vote, format: :json)
end
