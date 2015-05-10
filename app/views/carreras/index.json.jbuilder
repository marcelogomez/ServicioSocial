json.array!(@carreras) do |carrera|
  json.extract! carrera, :id, :nombre, :iniciales, :semestres
  json.url carrera_url(carrera, format: :json)
end
