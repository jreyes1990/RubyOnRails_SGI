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
require 'rails_helper'

RSpec.describe SolicitudCambio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
