json.extract! adminpage, :id, :name, :email, :password, :created_at, :updated_at
json.url adminpage_url(adminpage, format: :json)