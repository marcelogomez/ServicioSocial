class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.string :descripcion
      t.datetime :registro_inicio
      t.datetime :registro_fin
      t.integer :ubicacion_id
      t.integer :admin_id
      t.integer :horas
      t.string :requisitos

      t.timestamps null: false
    end
  end
end
