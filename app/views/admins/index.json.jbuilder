json.array!(@admins) do |admin|
  json.extract! admin, :id, :login, :nombre, :apellido, :correo, :telefono
  json.url admin_url(admin, format: :json)
end
