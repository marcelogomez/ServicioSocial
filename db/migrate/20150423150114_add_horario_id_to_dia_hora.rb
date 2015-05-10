class AddHorarioIdToDiaHora < ActiveRecord::Migration
  def change
    add_column :dia_horas, :horario_id, :integer
  end
end
