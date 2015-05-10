class CreateUbicacions < ActiveRecord::Migration
  def change
    create_table :ubicacions do |t|
      t.string :name
      t.string :iniciales
      t.string :direccion
      t.string :descripcion
      t.string :maps

      t.timestamps null: false
    end
  end
end
