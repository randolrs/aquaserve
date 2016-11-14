json.extract! service_request, :id, :email, :zip_code, :gallons_in_tank, :salt_water, :phone_number, :created_at, :updated_at
json.url service_request_url(service_request, format: :json)