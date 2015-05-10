class CreateListaEsperaProyectos < ActiveRecord::Migration
  def change
    create_table :lista_espera_proyectos do |t|
      t.integer :proyecto_id
      t.integer :usuario

      t.timestamps null: false
    end
  end
end
