# == Schema Information
#
# Table name: solicitud_cambios
#
#  id                  :integer          not null, primary key
#  fecha_solicitud     :date
#  descripcion         :string(255)
#  estado_documento_id :integer
#  etapa_solicitud_id  :integer
#  user_created_id     :integer
#  user_updated_id     :integer
#  estado              :string(10)
#  documento_id        :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class SolicitudCambio < ApplicationRecord
  belongs_to :documento
  belongs_to :estado_documento
  #belongs_to :etapa_solicitud

  has_many :bitacora_solicitud_cambios
  has_many :seguimiento_solicitudes

  has_one_attached :file_solicitud
  has_one_attached :file_solicitud_word_preview

  validates_presence_of :fecha_solicitud, :descripcion, :estado_documento_id, :estado, :documento_id, message: ": este campo es obligatorio"
  validates :fecha_solicitud, uniqueness: {case_sensitive: false, scope: [:estado_documento_id, :estado, :documento_id], message: "El nombre que intenta registrar ya existe" }
end
