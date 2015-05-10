class Horario < ActiveRecord::Base
  has_many :dia_horas
  belongs_to :proyecto

  has_many :lista_espera_proyectos
  has_many :usuarios, :through => :lista_espera_proyectos
end
