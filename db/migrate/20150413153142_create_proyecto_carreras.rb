class CreateProyectoCarreras < ActiveRecord::Migration
  def change
    create_table :proyecto_carreras do |t|
      t.integer :proyecto_id
      t.integer :carrera_id

      t.timestamps null: false
    end
  end
end
