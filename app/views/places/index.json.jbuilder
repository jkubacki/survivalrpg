json.array!(@places) do |place|
  json.extract! place, :id, :name, :description, :frequency
  json.url place_url(place, format: :json)
end
