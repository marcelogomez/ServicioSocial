class Proyecto < ActiveRecord::Base
  belongs_to :admin
  belongs_to :ubicacion

  has_many :proyecto_carreras
  has_many :carreras, :through => :proyecto_carreras

  has_many :horarios
end