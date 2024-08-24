# == Schema Information
#
# Table name: bitacora_seguimientos
#
#  id                       :integer          not null, primary key
#  fecha_seguimiento        :date
#  version                  :integer
#  fecha_vigencia           :date
#  descripcion              :string(255)
#  estado_documento_id      :integer
#  etapa_seguimiento_id     :integer
#  user_created_id          :integer
#  user_updated_id          :integer
#  estado                   :string(10)
#  solicitud_cambio_id      :integer
#  seguimiento_solicitud_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require 'rails_helper'

RSpec.describe BitacoraSeguimiento, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
