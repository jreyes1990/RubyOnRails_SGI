# == Schema Information
#
# Table name: labors
#
#  id              :bigint           not null, primary key
#  nombre          :string
#  tiempo          :string
#  numero_personas :integer
#  descripcion     :string
#  estado          :string
#  area_id         :integer
#  user_created_id  :integer
#  user_updated_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class LaborTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
