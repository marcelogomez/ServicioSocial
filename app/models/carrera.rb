class Carrera < ActiveRecord::Base
  has_many :usuario
  has_many :proyecto_carreras
  has_many :proyectos, :through => :proyecto_carreras
end