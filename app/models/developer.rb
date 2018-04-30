class Developer < ActiveRecord::Base
  validates_presence_of :name, :message => "Introduzca el nombre"
  validates_uniqueness_of :name, :message => "El desarrollador está repetido"
  validates_length_of :name, :in => 2..555, :message => "Nombre muy corto"
end
