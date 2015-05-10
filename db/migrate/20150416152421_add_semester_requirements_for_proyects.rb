class AddSemesterRequirementsForProyects < ActiveRecord::Migration
  def change
    add_column :proyectos, :semestre_minimo, :integer
    add_column :proyectos, :semestre_max, :integer
  end
end
