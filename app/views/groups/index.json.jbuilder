json.array!(@groups) do |group|
  json.extract! group, :id, :posisi, :keterangan
  json.url group_url(group, format: :json)
end
