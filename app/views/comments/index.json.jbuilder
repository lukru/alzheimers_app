json.array!(@comments) do |comment|
  json.extract! comment, :id, :author_name, :comment_text, :references, :references
  json.url comment_url(comment, format: :json)
end
