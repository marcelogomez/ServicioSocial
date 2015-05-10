class Admin < ActiveRecord::Base
  # validates_format_of :login, :with => /L[0-9]{8}/, :on => :create
  validates_uniqueness_of :login
  has_many :proyectos
end