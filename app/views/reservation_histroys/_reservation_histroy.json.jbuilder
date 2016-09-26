json.extract! reservation_histroy, :id, :from, :to, :date, :rooms_id, :users_id, :created_at, :updated_at
json.url reservation_histroy_url(reservation_histroy, format: :json)