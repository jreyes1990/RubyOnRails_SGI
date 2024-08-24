# == Schema Information
#
# Table name: equipos
#
#  id                :bigint           not null, primary key
#  tipo_equipo_id    :bigint           not null
#  orden_trabajo_id  :integer
#  area_id           :integer
#  codigo_empleado   :string
#  nombre_empleado   :string
#  estado            :string
#  user_created_id    :integer
#  user_updated_id    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  estado_asignacion :string
#  combo_id          :integer
#  observacion       :string
#
require 'test_helper'

class EquipoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
