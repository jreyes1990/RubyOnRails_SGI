# == Schema Information
#
# Table name: seguimiento_solicitudes
#
#  id                   :integer          not null, primary key
#  fecha_seguimiento    :date
#  version              :integer
#  fecha_vigencia       :date
#  descripcion          :string(255)
#  estado_documento_id  :integer
#  etapa_seguimiento_id :integer
#  user_created_id      :integer
#  user_updated_id      :integer
#  estado               :string(10)
#  solicitud_cambio_id  :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class SeguimientoSolicitud < ApplicationRecord
  belongs_to :solicitud_cambio
  belongs_to :estado_documento

  validates_presence_of :fecha_seguimiento, :descripcion, :estado_documento_id, :solicitud_cambio_id, :estado, message: ": este campo es obligatorio"
  validates :fecha_seguimiento, uniqueness: {case_sensitive: false, scope: [:estado_documento_id, :solicitud_cambio_id, :estado], message: "El nombre que intenta registrar ya existe" }

  has_one_attached :file_seguimiento_pdf
  has_one_attached :file_seguimiento_word
  has_one_attached :file_seguimiento_word_preview
  has_one_attached :file_seguimiento_excel
  has_one_attached :file_seguimiento_excel_preview

  before_create :destroy_seguimiento_anteriores
  before_create :update_solicitud
  after_create :inactiva_seguimiento_autorizado

  def destroy_seguimiento_anteriores
    @seguimientoExistente = SeguimientoSolicitud.where('solicitud_cambio_id=?',self.solicitud_cambio_id).destroy_all
  end

  def update_solicitud
    if self.estado_documento_id != 1
      @solitud = SolicitudCambio.find(self.solicitud_cambio_id).update(:estado_documento_id => self.estado_documento_id)
    else
      @solitud = SolicitudCambio.find(self.solicitud_cambio_id).update(:estado_documento_id => self.estado_documento_id, :estado => 'I')
    end
  end

  def inactiva_seguimiento_autorizado
    @seguimientoDestroy = SeguimientoSolicitud.where('solicitud_cambio_id=? and estado_documento_id=?',self.solicitud_cambio_id,1).update(:estado => 'I')
  end

end
