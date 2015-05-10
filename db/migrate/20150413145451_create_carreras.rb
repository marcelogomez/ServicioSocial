class CreateCarreras < ActiveRecord::Migration
  def change
    create_table :carreras do |t|
      t.string :nombre
      t.string :iniciales
      t.integer :semestres

      t.timestamps null: false
    end
  end
end
