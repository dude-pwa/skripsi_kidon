json.array!(@criteria) do |criterium|
  json.extract! criterium, :id, :tinggi_badan, :berat_badan, :kecepatan_berlari, :akurasi_tendangan, :prestasi, :member_id, :group_id
  json.url criterium_url(criterium, format: :json)
end
