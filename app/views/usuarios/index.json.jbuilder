json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :matricula, :nombre, :apellido, :carrera_id, :semestre, :telefono, :correo, :facebook
  json.url usuario_url(usuario, format: :json)
end
