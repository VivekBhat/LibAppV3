json.extract! booking_histroy, :id, :from, :to, :date, :created_at, :updated_at
json.url booking_histroy_url(booking_histroy, format: :json)