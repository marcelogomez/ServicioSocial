json.array!(@ubicacions) do |ubicacion|
  json.extract! ubicacion, :id, :name, :iniciales, :direccion, :descripcion, :maps
  json.url ubicacion_url(ubicacion, format: :json)
end
