json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :url, :topic_id
  json.url bookmark_url(bookmark, format: :json)
end
