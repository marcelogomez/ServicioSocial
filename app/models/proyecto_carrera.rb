class ProyectoCarrera < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :carrera
end
