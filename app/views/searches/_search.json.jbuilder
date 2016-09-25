json.extract! search, :id, :roomNumber, :size, :status, :building, :created_at, :updated_at
json.url search_url(search, format: :json)