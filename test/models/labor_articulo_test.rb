# == Schema Information
#
# Table name: labor_articulos
#
#  id             :bigint           not null, primary key
#  labor_id       :bigint           not null
#  articulo_id    :bigint           not null
#  cantidad       :string
#  estado         :string
#  area_id        :integer
#  user_created_id :integer
#  user_updated_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class LaborArticuloTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
