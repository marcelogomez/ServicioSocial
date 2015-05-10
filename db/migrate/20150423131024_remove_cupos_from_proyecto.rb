class RemoveCuposFromProyecto < ActiveRecord::Migration
  def change
    remove_column :proyectos, :cupos
  end
end
