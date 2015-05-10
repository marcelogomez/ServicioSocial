class AddHorarioToAssignmentRelation < ActiveRecord::Migration
  def change
    add_column :lista_espera_proyectos, :horario_id, :integer
  end
end
