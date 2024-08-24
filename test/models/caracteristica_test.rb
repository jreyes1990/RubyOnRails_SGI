# == Schema Information
#
# Table name: caracteristicas
#
#  id              :bigint           not null, primary key
#  nombre          :string
#  descripcion     :string
#  estado          :string
#  user_created_id  :integer
#  user_updated_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  area_id         :integer
#  tipo_dato_id    :bigint
#  incluir_reporte :string
#  requerido       :string
#
require 'test_helper'

class CaracteristicaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
