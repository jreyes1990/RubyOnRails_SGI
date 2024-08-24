# == Schema Information
#
# Table name: tipo_equipos
#
#  id             :bigint           not null, primary key
#  nombre         :string
#  descripcion    :string
#  estado         :string
#  user_created_id :integer
#  user_updated_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  area_id        :integer
#
require 'test_helper'

class TipoEquipoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
