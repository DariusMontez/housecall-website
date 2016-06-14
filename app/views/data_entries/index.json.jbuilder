json.array!(@data_entries) do |data_entry|
  json.extract! data_entry, :id
  json.url data_entry_url(data_entry, format: :json)
end
