# == Schema Information
#
# Table name: personas_areas
#
#  id              :integer          not null, primary key
#  persona_id      :integer          not null
#  area_id         :integer          not null
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class PersonasAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
