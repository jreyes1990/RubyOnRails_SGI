# == Schema Information
#
# Table name: detalle_equipos
#
#  id                    :bigint           not null, primary key
#  equipo_id             :bigint           not null
#  caracteristica_id     :integer
#  nombre_caracteristica :string
#  valor_caracteristica  :string
#  estado                :string
#  user_created_id        :integer
#  user_updated_id        :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require 'test_helper'

class DetalleEquipoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
