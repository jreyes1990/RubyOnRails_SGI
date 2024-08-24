# == Schema Information
#
# Table name: permiso_documentos
#
#  id                :integer          not null, primary key
#  tipo_usuario_id   :integer
#  proceso_id        :integer
#  tipo_sistema_id   :integer
#  documento_id      :integer
#  todo              :string(10)
#  user_created_id   :integer
#  user_updated_id   :integer
#  estado            :string(10)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tipo_documento_id :integer
#
class PermisoDocumento < ApplicationRecord
  belongs_to :tipo_usuario
  belongs_to :proceso
  belongs_to :tipo_sistema
  belongs_to :tipo_documento
  belongs_to :documento

  has_many :permiso_documento_usuarios

  validates_presence_of :tipo_usuario_id, :tipo_sistema_id, :proceso_id, :tipo_documento_id, :documento_id, message: ": este campo es obligatorio"
  validates :tipo_usuario_id, uniqueness: {case_sensitive: false, scope: [:proceso_id, :tipo_sistema_id, :tipo_documento_id, :documento_id, :estado], message: "El nombre que intenta registrar ya existe" }

  def desc_permiso_docto

    if self.tipo_sistema_id != 0 && self.proceso_id != 0 && self.tipo_documento_id != 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / #{self.proceso.nombre} / #{self.tipo_documento.nombre} / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    elsif self.tipo_sistema_id != 0 && self.proceso_id != 0 && self.tipo_documento_id != 0 && self.documento_id == 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / #{self.proceso.nombre} / #{self.tipo_documento.nombre} / Todos los documentos"
    elsif self.tipo_sistema_id != 0 && self.proceso_id != 0 && self.tipo_documento_id == 0 && self.documento_id == 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / #{self.proceso.nombre} / Todos los tipos documentos / Todos los documentos"
    elsif self.tipo_sistema_id != 0 && self.proceso_id == 0 && self.tipo_documento_id == 0 && self.documento_id == 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / Todos los procesos / Todos los tipos documentos / Todos los documentos"
    elsif self.tipo_sistema_id != 0 && self.proceso_id == 0 && self.tipo_documento_id == 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / Todos los procesos / Todos los tipos documentos / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    elsif self.tipo_sistema_id != 0 && self.proceso_id == 0 && self.tipo_documento_id != 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / Todos los procesos / #{self.tipo_documento.nombre} / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    elsif self.tipo_sistema_id != 0 && self.proceso_id != 0 && self.tipo_documento_id == 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / #{self.proceso.nombre} / Todos los tipos documentos / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    elsif self.tipo_sistema_id != 0 && self.proceso_id == 0 && self.tipo_documento_id != 0 && self.documento_id == 0
      "#{self.tipo_usuario.nombre} / #{self.tipo_sistema.nombre} / Todos los procesos / #{self.tipo_documento.nombre} / Todos los documentos"

    elsif self.tipo_sistema_id == 0 && self.proceso_id != 0 && self.tipo_documento_id == 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / Todos los sistemas / #{self.proceso.nombre} / Todos los tipos documentos / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    elsif self.tipo_sistema_id == 0 && self.proceso_id == 0 && self.tipo_documento_id != 0 && self.documento_id == 0
      "#{self.tipo_usuario.nombre} / Todos los sistemas / Todos los procesos / #{self.tipo_documento.nombre} / Todos los documentos"
    elsif self.tipo_sistema_id == 0 && self.proceso_id == 0 && self.tipo_documento_id != 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / Todos los sistemas / Todos los procesos / #{self.tipo_documento.nombre} / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    elsif self.tipo_sistema_id == 0 && self.proceso_id != 0 && self.tipo_documento_id == 0 && self.documento_id == 0
      "#{self.tipo_usuario.nombre} / Todos los sistemas / #{self.proceso.nombre} / Todos los tipos documentos / Todos los documentos"
    elsif self.tipo_sistema_id == 0 && self.proceso_id != 0 && self.tipo_documento_id != 0 && self.documento_id == 0
      "#{self.tipo_usuario.nombre} / Todos los sistemas / #{self.proceso.nombre} / #{self.tipo_documento.nombre} / Todos los documentos"
    elsif self.tipo_sistema_id == 0 && self.proceso_id != 0 && self.tipo_documento_id != 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / Todos los sistemas / #{self.proceso.nombre} / #{self.tipo_documento.nombre} / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    elsif self.tipo_sistema_id == 0 && self.proceso_id == 0 && self.tipo_documento_id == 0 && self.documento_id != 0
      "#{self.tipo_usuario.nombre} / Todos los sistemas / Todos los procesos / Todos los tipos documentos / #{self.documento.codigo}#{self.documento.correlativo}: #{self.documento.nombre}"
    else
      "#{self.tipo_usuario.nombre} / Todos los sistemas / Todos los procesos / Todos los tipos documentos / Todos los documentos"
    end
  end
end
