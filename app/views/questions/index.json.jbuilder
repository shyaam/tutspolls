json.array!(@questions) do |question|
  json.extract! question, :id, :poll_id, :title, :type
  json.url question_url(question, format: :json)
end
