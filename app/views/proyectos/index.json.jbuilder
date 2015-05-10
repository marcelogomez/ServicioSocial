json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :nombre, :descripcion, :registro_inicio, :registro_fin, :ubicacion_id, :admin_id, :horas, :requisitos
  json.url proyecto_url(proyecto, format: :json)
end
