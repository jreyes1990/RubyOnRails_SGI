# == Schema Information
#
# Table name: actividades
#
#  id              :integer          not null, primary key
#  nombre          :string(200)
#  descripcion     :string(255)
#  empresa_id      :integer
#  user_created_id :integer
#  user_updated_id :integer
#  estado          :string(10)
#  proceso_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Actividad, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
