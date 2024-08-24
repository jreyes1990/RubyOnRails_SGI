# == Schema Information
#
# Table name: detalle_orden_trabajos
#
#  id                        :bigint           not null, primary key
#  orden_trabajo_id          :bigint           not null
#  nombre_empleado           :string
#  codigo_empleado           :string
#  equipo_id                 :bigint           not null
#  mantenimiento_id          :integer
#  labor_id                  :integer
#  nombre_labor              :string
#  descripcion_labor         :string
#  tiempo_labor              :string
#  numero_persona_labor      :integer
#  articulo_id               :integer
#  nombre_articulo           :string
#  cantidad_articulo         :integer
#  estado                    :string
#  user_created_id            :integer
#  user_updated_id            :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  unidad_medida_articulo    :string
#  nombre_tipo_mantenimiento :string
#  proveedor_id              :integer
#  nombre_proveedor          :string
#  observacion_falla         :string
#  observacion_envio         :string
#
require 'test_helper'

class DetalleOrdenTrabajoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
