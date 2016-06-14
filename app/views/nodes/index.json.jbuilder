json.array!(@nodes) do |node|
  json.extract! node, :id, :mac_address, :location_id
  json.url node_url(node, format: :json)
end
