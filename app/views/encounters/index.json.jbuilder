json.array!(@encounters) do |encounter|
  json.extract! encounter, :id, :name, :description, :frequency
  json.url encounter_url(encounter, format: :json)
end
