# == Schema Information
#
# Table name: tipo_transaccions
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
#  path           :string
#
require 'test_helper'

class TipoTransaccionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
