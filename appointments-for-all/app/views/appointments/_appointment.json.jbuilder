json.extract! appointment, :id, :start_time_at, :end_time_at, :customer_id, :professional_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
