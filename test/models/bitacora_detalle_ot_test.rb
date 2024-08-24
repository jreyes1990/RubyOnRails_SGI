# == Schema Information
#
# Table name: bitacora_detalle_ots
#
#  id                       :bigint           not null, primary key
#  detalle_orden_trabajo_id :bigint           not null
#  accion                   :string
#  descripcion              :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  user                     :integer
#  fecha                    :string
#  hora                     :string
#  equipo                   :string
#
require 'test_helper'

class BitacoraDetalleOtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
