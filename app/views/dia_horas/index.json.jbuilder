json.array!(@dia_horas) do |dia_hora|
  json.extract! dia_hora, :id, :dia, :hora_inicio, :hora_fin
  json.url dia_hora_url(dia_hora, format: :json)
end
