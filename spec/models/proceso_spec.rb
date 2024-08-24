# == Schema Information
#
# Table name: procesos
#
#  id               :integer          not null, primary key
#  nombre           :string(200)
#  descripcion      :string(255)
#  abreviatura      :string(5)
#  empresa_id       :integer
#  user_created_id  :integer
#  user_updated_id  :integer
#  estado           :string(10)
#  macro_proceso_id :integer          not null
#  tipo_proceso_id  :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Proceso, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
