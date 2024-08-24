# == Schema Information
#
# Table name: detalle_combos
#
#  id             :bigint           not null, primary key
#  combo_id       :bigint           not null
#  equipo_id      :integer
#  estado         :string
#  user_created_id :integer
#  user_updated_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class DetalleComboTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
