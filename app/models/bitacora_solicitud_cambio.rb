# == Schema Information
#
# Table name: bitacora_solicitud_cambios
#
#  id                  :integer          not null, primary key
#  fecha_solicitud     :date
#  descripcion         :string(255)
#  documento_id        :integer
#  estado_documento_id :integer
#  etapa_solicitud_id  :integer
#  user_created_id     :integer
#  user_updated_id     :integer
#  estado              :string(10)
#  solicitud_cambio_id :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class BitacoraSolicitudCambio < ApplicationRecord
  belongs_to :solicitud_cambio
end
