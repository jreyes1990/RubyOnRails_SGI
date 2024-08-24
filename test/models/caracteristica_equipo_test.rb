# == Schema Information
#
# Table name: caracteristica_equipos
#
#  id                :bigint           not null, primary key
#  tipo_equipo_id    :bigint           not null
#  caracteristica_id :bigint           not null
#  estado            :string
#  area_id           :integer
#  user_created_id    :integer
#  user_updated_id    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class CaracteristicaEquipoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
