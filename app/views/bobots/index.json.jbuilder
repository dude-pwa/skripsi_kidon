json.array!(@bobots) do |bobot|
  json.extract! bobot, :id, :w1, :w2, :w3, :w4, :w5
  json.url bobot_url(bobot, format: :json)
end
