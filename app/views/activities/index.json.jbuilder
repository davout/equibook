json.array!(@activities) do |activity|
  json.extract! activity, :id, :horse_id, :user_id, :start_at, :end_at, :title, :description
  json.url activity_url(activity, format: :json)
end
