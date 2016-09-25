json.extract! room, :id, :roomNumber, :size, :status, :building, :date, :time, :created_at, :updated_at
json.url room_url(room, format: :json)