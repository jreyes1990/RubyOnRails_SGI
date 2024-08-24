# == Schema Information
#
# Table name: bitacora_ots
#
#  id               :bigint           not null, primary key
#  orden_trabajo_id :bigint           not null
#  accion           :string
#  descripcion      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user             :integer
#  fecha            :string
#  hora             :string
#  equipo           :string
#
require 'test_helper'

class BitacoraOtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
