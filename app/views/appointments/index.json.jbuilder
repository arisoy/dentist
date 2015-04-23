json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :title, :description
  json.url appointment_url(appointment, format: :json)
end
