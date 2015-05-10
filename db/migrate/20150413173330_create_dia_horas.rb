class CreateDiaHoras < ActiveRecord::Migration
  def change
    drop_table :dia_horas
    create_table :dia_horas do |t|
      t.integer :dia
      t.time :hora_inicio
      t.time :hora_fin

      t.timestamps null: false
    end
  end
end
