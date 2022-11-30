json.extract! event, :id, :title, :date, :description, :start_point, :end_point, :difficulty, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
