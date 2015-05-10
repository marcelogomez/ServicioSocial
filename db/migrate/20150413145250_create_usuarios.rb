class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :matricula
      t.string :nombre
      t.string :apellido
      t.integer :carrera_id
      t.integer :semestre
      t.string :telefono
      t.string :correo
      t.string :facebook

      t.timestamps null: false
    end
  end
end
