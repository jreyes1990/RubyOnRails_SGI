# == Schema Information
#
# Table name: orden_trabajos
#
#  id                      :bigint           not null, primary key
#  tipo_transaccion_id     :bigint           not null
#  user_id                 :bigint           not null
#  estado_orden_trabajo_id :bigint           not null
#  fecha_referencia        :date
#  observaciones           :string
#  area_id                 :integer
#  estado                  :string
#  user_created_id          :integer
#  user_updated_id          :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require 'test_helper'

class OrdenTrabajoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
