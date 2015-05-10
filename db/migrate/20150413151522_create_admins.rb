class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :login
      t.string :nombre
      t.string :apellido
      t.string :correo
      t.string :telefono

      t.timestamps null: false
    end
  end
end
