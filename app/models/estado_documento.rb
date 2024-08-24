# == Schema Information
#
# Table name: estado_documentos
#
#  id                 :integer          not null, primary key
#  nombre             :string(100)
#  descripcion        :string(255)
#  empresa_id         :integer
#  user_created_id    :integer
#  user_updated_id    :integer
#  estado             :string(10)
#  etapa_documento_id :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class EstadoDocumento < ApplicationRecord
  belongs_to :etapa_documento
  belongs_to :empresa

  validates_presence_of :nombre, :empresa_id, :etapa_documento_id, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:empresa_id, :etapa_documento_id, :estado], message: "El nombre que intenta registrar ya existe" }

  has_many :documentos
  has_many :bitacora_documentos
  has_many :solicitud_cambios
  has_many :seguimiento_solicitudes

  def estado_documento_etapa
    "#{self.nombre} | #{self.etapa_documento.nombre}"
  end
end
