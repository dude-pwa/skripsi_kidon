json.array!(@rekap_data) do |rekap_datum|
  json.extract! rekap_datum, :id, :nama, :tanggal_lahir, :alamat, :handphone, :posisi, :nilai, :ranking
  json.url rekap_datum_url(rekap_datum, format: :json)
end
