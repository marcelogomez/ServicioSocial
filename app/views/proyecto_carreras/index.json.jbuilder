json.array!(@proyecto_carreras) do |proyecto_carrera|
  json.extract! proyecto_carrera, :id, :proyecto_id, :carrera_id
  json.url proyecto_carrera_url(proyecto_carrera, format: :json)
end
