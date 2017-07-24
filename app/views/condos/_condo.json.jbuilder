json.extract! condo, :id, :name, :location, :latittude, :longitude, :city, :state, :country, :zip_code, :phone_number, :hours, :created_at, :updated_at
json.url condo_url(condo, format: :json)
