json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :priority
  json.url patient_url(patient, format: :json)
end
