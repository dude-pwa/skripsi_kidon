json.array!(@members) do |member|
  json.extract! member, :id, :nama, :alamat
  json.url member_url(member, format: :json)
end
