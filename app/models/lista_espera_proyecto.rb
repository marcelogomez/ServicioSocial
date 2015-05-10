class ListaEsperaProyecto < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :horario
end
