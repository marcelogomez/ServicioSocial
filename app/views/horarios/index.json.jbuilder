json.array!(@horarios) do |horario|
  json.extract! horario, :id, :capacidad, :proyecto_id
  json.url horario_url(horario, format: :json)
end
