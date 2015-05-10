class DiaHora < ActiveRecord::Base
  # Solo una en el mismo dia por horario
  belongs_to :horario
  def to_s
    days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
    return "#{days[self.dia]} #{self.hora_inicio.hour < 10? "0" : ""}#{self.hora_inicio.hour}:#{self.hora_inicio.min < 10? "0" : ""}#{self.hora_inicio.min} - #{self.hora_fin.hour < 10? "0" : ""}#{self.hora_fin.hour}:#{self.hora_fin.min < 10? "0" : ""}#{self.hora_fin.min}"
  end
end