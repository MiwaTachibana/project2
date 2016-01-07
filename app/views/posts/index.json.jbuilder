json.array!(@posts) do |post|
  json.extract! post, :id, :description, :title, :content, :is_completed
  json.url post_url(post, format: :json)
end
