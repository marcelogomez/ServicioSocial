json.array!(@lista_espera_proyectos) do |lista_espera_proyecto|
  json.extract! lista_espera_proyecto, :id, :proyecto_id, :usuario
  json.url lista_espera_proyecto_url(lista_espera_proyecto, format: :json)
end
