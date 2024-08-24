# == Schema Information
#
# Table name: estado_orden_trabajos
#
#  id             :bigint           not null, primary key
#  nombre         :string
#  descripcion    :string
#  estado         :string
#  area_id        :integer
#  user_created_id :integer
#  user_updated_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class EstadoOrdenTrabajoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
