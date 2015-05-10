class AddCupoToProjects < ActiveRecord::Migration
  def change
    add_column :proyectos, :cupos, :integer
  end
end
