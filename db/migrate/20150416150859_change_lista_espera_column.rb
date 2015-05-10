class ChangeListaEsperaColumn < ActiveRecord::Migration
  def change
    rename_column :lista_espera_proyectos, :usuario, :usuario_id
    add_column :lista_espera_proyectos, :aprobada, :boolean
  end
end
