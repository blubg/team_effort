json.extract! volunteer, :id, :first_name, :last_name, :email, :phone_number, :status, :created_at, :updated_at
json.url volunteer_url(volunteer, format: :json)