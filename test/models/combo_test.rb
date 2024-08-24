# == Schema Information
#
# Table name: combos
#
#  id             :bigint           not null, primary key
#  tipo_combo_id  :bigint           not null
#  estado         :string
#  area_id        :integer
#  user_created_id :integer
#  user_updated_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  estado_combo   :string
#
require 'test_helper'

class ComboTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
