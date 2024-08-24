# == Schema Information
#
# Table name: mantenimiento_labors
#
#  id               :bigint           not null, primary key
#  mantenimiento_id :bigint           not null
#  labor_id         :bigint           not null
#  descripcion      :string
#  estado           :string
#  area_id          :integer
#  user_created_id   :integer
#  user_updated_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class MantenimientoLaborTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
