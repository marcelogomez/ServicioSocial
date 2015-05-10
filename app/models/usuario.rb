class Usuario < ActiveRecord::Base
  # Todos los campos son obligatorios
  # validates_format_of :matricula, :with => /A[0-9]{8}/
  validates_uniqueness_of :matricula

  belongs_to :carrera

  has_many :lista_espera_proyectos
  has_many :horarios, :through => :lista_espera_proyectos

  def is_assigned_to_project(project)
    project.horarios.each do |horario|
      if self.is_assigned_to_horario horario
        return true
      end
    end
    false
  end

  def is_assigned_to_horario(horario)
    ListaEsperaProyecto.where(:horario_id => horario.id, :usuario_id => self.id).size > 0
  end
end
