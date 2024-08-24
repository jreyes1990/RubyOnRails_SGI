# == Schema Information
#
# Table name: mantenimientos
#
#  id                    :bigint           not null, primary key
#  tipo_mantenimiento_id :bigint           not null
#  tipo_equipo_id        :bigint           not null
#  descripcion           :string
#  estado                :string
#  area_id               :integer
#  user_created_id        :integer
#  user_updated_id        :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require 'test_helper'

class MantenimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
