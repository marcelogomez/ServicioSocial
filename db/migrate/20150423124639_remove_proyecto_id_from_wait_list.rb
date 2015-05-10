class RemoveProyectoIdFromWaitList < ActiveRecord::Migration
  def change
    remove_column :lista_espera_proyectos, :proyecto_id
  end
end
