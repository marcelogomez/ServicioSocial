class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.integer :capacidad
      t.integer :proyecto_id

      t.timestamps null: false
    end
  end
end
